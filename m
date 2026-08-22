Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240983C1414;
	Sat, 22 Aug 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787410432; cv=none; b=s1yo4lFMPab9sldyeGet78hqBWUksBILFcMiYoiA0YAkl9R2T9CLr0e400BFYlnzrn6dfabdmj8BRcb0IqAiMkdEOHX3V8LZz6FP4EF+R0hmsq6AlTzh2DsTHchmXxXB+gdRFO6AugRlICo6bh20VEOiYZ0/S3ZluGSEyhEU00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787410432; c=relaxed/simple;
	bh=a1UqV8eW/rcQCsp7QFKxeuZ3nHuWrvNTZ8mRiqZwORM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdmzlpUDU8YqbzU2UafGOXGqw7PifS3appsDG2KVLhfiua/edxGuaufTiCWB8cbrPn1XNpKQoNW0cMSU9+8TwYUQqkX3mt9IqBpe++omxvcRBiE7KZoZ13yKfJ/nGSw4xg/7H4lUh8xy+WRUVy4Zq20aURHqXSjCUWC/O7OsbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mu/ff3JL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mu/ff3JL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BmBVOGClBFtfsWf4aThmoEaYBh3pYi94hNgT36QdLtg=; b=mu/ff3JLIfokluYcBS+ivQUdda
	22CLPQ9nZYxTsvEucsUVEV467v/gg2FMWU/u4cj6oPQW25uoxe5X1IIX0mJXitQmWGUKaLdnRQjHJ
	p1OXu7UPEYSkaksGKhWngVn+xxqBmwMEvAsP2UCOY6IhADzD0F6ZsOWFhGcoelb5lMOI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wxn6G-0012Rd-1q; Sat, 22 Aug 2026 16:53:36 +0200
Date: Sat, 22 Aug 2026 16:53:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Roman Riabenko <roman@riabenko.com>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
Message-ID: <b37fa1dd-862f-48ac-98c9-4556c2bf3f94@lunn.ch>
References: <20260822052353.22881-1-roman@riabenko.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822052353.22881-1-roman@riabenko.com>

On Sat, Aug 22, 2026 at 08:23:53AM +0300, Roman Riabenko wrote:
> The 'rgmii' mode does not appear to describe the RGMII timing in Olimex
> A64-OlinuXino boards. The PCB layout shows that the clock and data
> traces have roughly the same lengths for both RX and TX and, thus, do
> not appear to implement the 2 ns RGMII delay or introduce any
> significant delay.
> 
> According to the KSZ9031RNX datasheet, the PHY adds a typical 1.2 ns RX
> delay and no TX delay by default. The 'rgmii-id' mode causes the PHY
> driver to enable appropriate internal RGMII delays.
> 
> Packet loss in the downlink direction is observed with the 'rgmii' mode
> and is severe enough to interfere with downloads and disrupt software
> installation. No packet loss is observed with 'rgmii-id'.
> 
> Adjusting the TX delay in the DT was found to be unnecessary with
> 'rgmii-id'.

Nice, thanks for doing a proper analysis.

> Signed-off-by: Roman Riabenko <roman@riabenko.com>

  Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
