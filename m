Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D055020E6
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 23:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6338C15;
	Sat, 21 Oct 2023 16:34:51 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EF2F3F64C;
	Sat, 21 Oct 2023 16:34:09 -0700 (PDT)
Date: Sun, 22 Oct 2023 00:33:05 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Icenowy Zheng
 <uwu@icenowy.me>, Maxim Kiselev <bigunclemax@gmail.com>, Sam Edwards
 <cfsworks@gmail.com>, Okhunjon Sobirjonov <okhunjon72@gmail.com>,
 linux-sunxi@lists.linux.dev, andre.przywara@foss.arm.com, Jagan Teki
 <jagan@amarulasolutions.com>, u-boot@lists.denx.de
Subject: Re: [PATCH v2 02/22] net: sunxi_emac: chase DT nodes to find PHY
 regulator
Message-ID: <20231022003305.7328f773@slackpad.lan>
In-Reply-To: <b8ab813d-790c-f1e4-bf77-29c7a2030464@sholland.org>
References: <20230928215455.28094-1-andre.przywara@arm.com>
	<20230928215455.28094-3-andre.przywara@arm.com>
	<b8ab813d-790c-f1e4-bf77-29c7a2030464@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Oct 2023 19:01:30 -0500
Samuel Holland <samuel@sholland.org> wrote:

Hi,

> Hi Andre,
> 
> On 9/28/23 16:54, Andre Przywara wrote:
> > At the moment the sun4i EMAC driver relies on hardcoded CONFIG_MACPWR
> > Kconfig symbols to enable potential PHY regulators. As we want to get rid
> > of those, we need to find the regulator by chasing up the DT.
> > 
> > The sun4i-emac binding puts the PHY regulator into the MDIO node, which
> > is the parent of the PHY device. U-Boot does not have (and does not
> > need) an MDIO driver, so we need to chase down the regulator through the
> > EMAC node: we follow the "phy-handle" property to find the PHY node,
> > then go up to its parent, where we find the "phy-supply" link to the
> > regulator. Let U-Boot find the associated regulator device, and put that
> > into the private device struct, so we can find and enable the regulator
> > at probe time, later.  
> 
> This does somewhat duplicate the logic from dm_eth_connect_phy_handle(),
> and putting the regulator in a UCLASS_MDIO device's probe function would
> work out cleanly (albeit with the usual DM overhead). But that can be a
> later refactoring.

Thanks for the suggestion, I will have a look later, there is more
cleanup possible in this file, it seems.
For now I like to accept this "...can be a later refactoring" ;-)

> 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Reviewed-by: Sam Edwards <CFSworks@gmail.com>
> > ---
> >  drivers/net/sunxi_emac.c | 39 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/net/sunxi_emac.c b/drivers/net/sunxi_emac.c
> > index 4c90d4b4981..f1f0e5bbbb2 100644
> > --- a/drivers/net/sunxi_emac.c
> > +++ b/drivers/net/sunxi_emac.c
> > @@ -17,6 +17,7 @@
> >  #include <net.h>
> >  #include <asm/io.h>
> >  #include <asm/arch/clock.h>
> > +#include <power/regulator.h>
> >  
> >  /* EMAC register  */
> >  struct emac_regs {
> > @@ -165,6 +166,7 @@ struct emac_eth_dev {
> >  	struct phy_device *phydev;
> >  	int link_printed;
> >  	uchar rx_buf[EMAC_RX_BUFSIZE];
> > +	struct udevice *phy_reg;
> >  };
> >  
> >  struct emac_rxhdr {
> > @@ -572,6 +574,9 @@ static int sunxi_emac_eth_probe(struct udevice *dev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (priv->phy_reg)
> > +		regulator_set_enable(priv->phy_reg, true);
> > +
> >  	return sunxi_emac_init_phy(priv, dev);
> >  }
> >  
> > @@ -585,9 +590,43 @@ static const struct eth_ops sunxi_emac_eth_ops = {
> >  static int sunxi_emac_eth_of_to_plat(struct udevice *dev)
> >  {
> >  	struct eth_pdata *pdata = dev_get_plat(dev);
> > +	struct emac_eth_dev *priv = dev_get_priv(dev);
> > +	struct ofnode_phandle_args args;
> > +	ofnode mdio_node;
> > +	int ret;
> >  
> >  	pdata->iobase = dev_read_addr(dev);
> >  
> > +	/* The PHY regulator is in the MDIO node, not the EMAC or PHY node. */
> > +	ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0, &args);  
> 
> You can use dev_get_phy_node() here. Either way:

Right, doesn't save too much, but isn't complicated either. I have
changed that.

> Reviewed-by: Samuel Holland <samuel@sholland.org>

Thanks!
Andre

> 
> > +	if (ret) {
> > +		dev_err(dev, "failed to get PHY node\n");
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * U-Boot does not have (and does not need) a device driver for the
> > +	 * MDIO device, so just "pass through" that DT node to get to the
> > +	 * regulator phandle.
> > +	 * The PHY regulator is optional, though: ignore if we cannot find
> > +	 * a phy-supply property.
> > +	 */
> > +	mdio_node = ofnode_get_parent(args.node);
> > +	ret= ofnode_parse_phandle_with_args(mdio_node, "phy-supply", NULL, 0, 0,
> > +					    &args);
> > +	if (ret && ret != -ENOENT) {
> > +		dev_err(dev, "failed to get PHY supply node\n");
> > +		return ret;
> > +	}
> > +	if (!ret) {
> > +		ret = uclass_get_device_by_ofnode(UCLASS_REGULATOR, args.node,
> > +						  &priv->phy_reg);
> > +		if (ret) {
> > +			dev_err(dev, "failed to get PHY regulator node\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	return 0;
> >  }
> >    
> 

