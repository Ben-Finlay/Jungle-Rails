describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("should navigate to Scented Blade", () => {
    cy.visit("/");
    cy.contains("span", "Scented")
    .click({force: true})
    cy.get(".products-show").should("be.visible");
  });
});
