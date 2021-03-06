using Xunit;
using System.Collections.Generic;
using System;
using System.Data;
using System.Data.SqlClient;

namespace OnlineStore.Objects
{
  public class CartProductTest : IDisposable
  {
    public CartProductTest()
    {
        DBConfiguration.ConnectionString = "Data Source=(localdb)\\mssqllocaldb;Initial Catalog= online_store_test;Integrated Security=SSPI;";
      }

      [Fact]
      public void EqualOverride_CartProductsAreSame_true()
      {
        //Arrange, Act
        CartProduct firstCartProduct = new CartProduct(2,2,5);
        CartProduct secondCartProduct= new CartProduct(2,2,5);

        Assert.Equal(firstCartProduct, secondCartProduct);
      }

      //GetAll returns empty list if no cartproducts
      [Fact]
      public void GetAll_ForNoCartProducts_EmptyList()
      {
        //Arrange, Act, Assert
        List<CartProduct> actualResult = CartProduct.GetAll();
        List<CartProduct> expectedResult = new List<CartProduct>{};

        Assert.Equal(expectedResult, actualResult);
      }

      //Checks if instances are saved to database
      [Fact]
      public void Save_ForCartProduct_SavesToDatabase()
      {
        //Arrange
        CartProduct newCartProduct = new CartProduct(2,2,5);

        //Act
        newCartProduct.Save();

        //Assert
        List<CartProduct> actualResult = CartProduct.GetAll();
        List<CartProduct> expectedResult = new List<CartProduct>{newCartProduct};

        Assert.Equal(expectedResult, actualResult);
      }

      //Deletes a single item from a cart based on user id and product id
      [Fact]
      public void Test_DeleteItem_RemovesAProductFromCart()
      {
        //Arrange
        CartProduct testCartProduct = new CartProduct(2,2,5);
        testCartProduct.Save();
        CartProduct secondCartProduct = new CartProduct(1,3,5);
        secondCartProduct.Save();

        //Act
        testCartProduct.DeleteItem();
        List<CartProduct> expected = new List<CartProduct> {secondCartProduct};
        List<CartProduct> result = CartProduct.GetAll();
        Console.WriteLine(string.Format("EXPECTED Id: {0}   user_id: {1}   product_id: {2}   quantity: {3}", expected[0].GetId(), expected[0].GetUserId(), expected[0].GetProductId(), expected[0].GetQuantity()));
        Console.WriteLine(string.Format("RESULT Id: {0}   user_id: {1}   product_id: {2}   quantity: {3}", result[0].GetId(), result[0].GetUserId(), result[0].GetProductId(), result[0].GetQuantity()));

        //Assert
        Assert.Equal(expected, result);
      }

      //clears all rows in table
      public void Dispose()
      {
        CartProduct.DeleteAll();
      }

      //Finds a particular item in the cart
      [Fact]
      public void Test_Find_FindsCartProductInDatabase()
      {
        //Arrange
        CartProduct testCartProduct = new CartProduct(2,2,5);
        testCartProduct.Save();
        // CartProduct secondCartProduct = new CartProduct(1,3,5);
        // secondCartProduct.Save();

        //Act
        CartProduct foundCartProduct = CartProduct.Find(testCartProduct.GetId());

        //Assert
        Assert.Equal(testCartProduct, foundCartProduct);
      }
    
    }
  }
