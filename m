Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA743AB292;
	Wed, 19 Aug 2026 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147296; cv=none; b=j6U+8METcB1XGvZtURYIDvLvV/M203Sv3C/mVQT3dAquRUBsPOrWQ2BSZgIf9B8EH87xQs0DJGlj5RDW9TC5dy5Brdz27Fj8WbhqglGSiAAZFFqCUfs4UgMt5kzgiGn7qsgw+6FJ6Kl8oBGWb2Wurw+U8ZLdjcBxFSZO55Utm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147296; c=relaxed/simple;
	bh=3mEfbSoQ5PqFo6MXopYthzuZIsLshO1DrjAkHXLOBBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkQZVudBvDwUzimOGy9qosBXGCKC2AT82HRsZa6Gv0N5j6bYKXGOH7Q+4mjjoKdqxTPzzsDq/F7I6V2Px/ndKKtFERWvIdADdnKXgqvOOtjTOA2SgoeYrBnNkosDFtx2J6wZIoGrU82SIxjtJnQ2uLN9XFFTIwPV6LA4vSWpP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lyxHHwl0; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lyxHHwl0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lhuJm5bU8coWF+IIzOxJmec7Ug+YIsKGfOtibniuIro=; b=lyxHHwl0o6jOPCBP+/vlesRMcX
	gJrFoI/qEtjf9ABnm0xeqWnhXU0o9ZVPgKC1blN8uMjCc78pXLUwcsoNh5C8mFvypXzdgX6kk0h3p
	9mftZnPy7mupjQOVjyRkTjCPoI47RWp5ZetpZk0NAAUW+t9l3TnvG75Xs1unKxN5wgu0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wwgeB-000c9n-8D; Wed, 19 Aug 2026 15:48:03 +0200
Date: Wed, 19 Aug 2026 15:48:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Roman Riabenko <roman@riabenko.com>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX delay
Message-ID: <e9c26d2a-2426-43b7-8c68-89cc52a2c7cb@lunn.ch>
References: <20260815005316.28998-1-roman@riabenko.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815005316.28998-1-roman@riabenko.com>

On Sat, Aug 15, 2026 at 03:53:16AM +0300, Roman Riabenko wrote:
> The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
> greater than 0. If the value is not set or is 0, packet loss in the
> downlink direction is severe enough to interfere with downloads and
> disrupt software installation.
> 
> The range of acceptable values is wide. The vendor has been applying
> 200 ps in its downstream DTs since 2021. This patch matches that
> common practice.
> 
> Signed-off-by: Roman Riabenko <roman@riabenko.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> index fd3794678c33..6c8b79c257b9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> @@ -106,6 +106,7 @@ &emac {
>  	phy-handle = <&ext_rgmii_phy>;
>  	phy-supply = <&reg_dcdc1>;
>  	allwinner,tx-delay-ps = <600>;
> +	allwinner,rx-delay-ps = <200>;
>  	status = "okay";
>  };

The full node is:

&emac {
        pinctrl-names = "default";
        pinctrl-0 = <&rgmii_pins>;
        phy-mode = "rgmii";
        phy-handle = <&ext_rgmii_phy>;
        phy-supply = <&reg_dcdc1>;
        allwinner,tx-delay-ps = <600>;
        status = "okay";
};

Please take a read of:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode of "rgmii" is questionable. Does the PCB have extra long
clock lines?

600/200ps is actually very small. It should be around 2000.

	  Andrew
