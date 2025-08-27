Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A4E34CF9
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Aug 2025 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756276831; cv=none; b=ooB1xJnXKRROlbIRIHTxg7vXXGgTDsYbHA/qG0MR0tWL+N2FKhUNxuvGIJaAyY4TJjFW13CxJ4xP39VXvWHdRR1FuO5XX+faYo5Foa4Q3Xal6yUAFtsQE6H0EDbT6T7KOZ1mibr04SONgFXNiiMaIP79uQN6AgstvqxgU1zLo3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756276831; c=relaxed/simple;
	bh=XZgrDnv9SWmzdVgGFNQhIVjV/gKYCMTTcBovuctsQOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rdO9o0HOwanRND7hsMim+tPA+DKHtwoaEzPAqo+i1ifNVZ/LzyXndC/js8QiEpyorgdzQLOujd4QnfpQCBuGSVl+TvemoB2MqamrUbjHEcgJK81cIlkVkUEm1IcnNcCUjpFX+PQLyVnUdp4PEqwIihfmPrA6qT+7K2LH1lSuDGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.212.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 20c18d712;
	Wed, 27 Aug 2025 14:40:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: iuncuim@gmail.com
Cc: andre.przywara@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mturquette@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	samuel@sholland.org,
	sboyd@kernel.org,
	vkoul@kernel.org,
	wens@csie.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 4/7] phy: allwinner: a523: add USB3/PCIe PHY driver
Date: Wed, 27 Aug 2025 14:40:10 +0800
Message-Id: <20250827064010.55675-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250816084700.569524-5-iuncuim@gmail.com>
References: <20250816084700.569524-5-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98ea417a0203a2kunmedb397446d055
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH09DVkNOHR5PThkYSh9KSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSVVCWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUpKVUpLS1VLWQ
	Y+

Hi,

> --- a/drivers/phy/allwinner/Makefile
> +++ b/drivers/phy/allwinner/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_PHY_SUN4I_USB)		+= phy-sun4i-usb.o
>  obj-$(CONFIG_PHY_SUN6I_MIPI_DPHY)	+= phy-sun6i-mipi-dphy.o
>  obj-$(CONFIG_PHY_SUN9I_USB)		+= phy-sun9i-usb.o
>  obj-$(CONFIG_PHY_SUN50I_USB3)		+= phy-sun50i-usb3.o
> +obj-$(CONFIG_PHY_SUN55I_USB3_PCIE)		+= phy-sun55i-usb3-pcie.o

Would it be better to call it phy-sun55i-combophy ?

> --- /dev/null
> +++ b/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c
> ...
> +static int sun55i_usb3_pcie_phy_init(struct phy *_phy)
> +{
> +	struct sun55i_usb3_pcie_phy *phy = phy_get_drvdata(_phy);
> +
> +	sun55i_usb3_phy_open(phy);

Maybe we need to add `case PHY_TYPE_USB3:`
And use <&combophy PHY_TYPE_USB3> in the DT

> +
> +	return 0;
> +}
> ...

> +static const struct of_device_id sun55i_usb3_pcie_phy_of_match[] = {
> +	{ .compatible = "allwinner,sun55i-a523-usb3-pcie-phy" },

Would it be better to use "allwinner,sun55i-a523-combophy" as
the compatible?

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sun55i_usb3_pcie_phy_of_match);

Thanks,
Chukun
