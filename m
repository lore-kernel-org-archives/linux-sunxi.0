Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AFE3955D8;
	Thu, 13 Aug 2026 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627889; cv=none; b=KRCX8jzg0elqLxMQoMbo2F1o63S8F7moiGRJvlr1WMLAUAwkTOPSJx3KNuzJd94k/98lcRLyWUTRprRSnlSSdpfn01uo5+ovsg4gueGSb9ixdib0+qAAzVK6jKXa85aKQT4JQXkdC/5vN2RPxNnUEuQieAzah6+qndQTSgD4oR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627889; c=relaxed/simple;
	bh=D6AdaN8xQN2ViIQq4+zn2JHML8aRydv1+dPcaNntmao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofCWk2TvF6PGKt0fpXdj8azjsk9c6BPl9CIxnwdiIRyReJsC9IY9azCjvr6yAvawpXv3tWpT8HdekTyvE7sfz/VruyG1dflCBERtS0hXxXa5Q4/U+dRFNwwbbq6VLv4V2KEztKsRlkkYbHCawYM1eaqoCJQAe9v1ISsCo+xokdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MwVGOfQU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MwVGOfQU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M0tOB/uv0TR9Y5yCxLw6p1FK2MqTX1tNSOH3AAfyT5M=; b=MwVGOfQULmpDlfIuzW6I3IY3DA
	xt4hzXJh/Swo/dPiq1nDShuTaUY7u+d+OqiXXWP1FFnW+QQ4eUWLPHcnOtF0WhRvMypi5zuMQI7hI
	g9ndM/QinE5xYT2qRszFUKkFq+n6Qo4frAIpHHwtVxQxfeij4uY4pBbgSKqaqgPkFGQM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wuVWe-00HQyG-4i; Thu, 13 Aug 2026 15:31:16 +0200
Date: Thu, 13 Aug 2026 15:31:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
Message-ID: <a11a5072-2477-41b6-8cc3-cb9aa75266cd@lunn.ch>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>
 <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-independent-ladybug-of-perfection-1afe7a@quoll>

On Thu, Aug 13, 2026 at 08:49:33AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 11, 2026 at 05:11:30PM -0600, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> > 
> > Describe the parent device and its shared input clock. The Ethernet PHY
> > is represented by a PHY package on its MDIO bus, with a phandle back to
> > this device for access to the package control registers, so it does not
> > require an MFD child node. Function-specific supplies belong to their
> > consumer bindings rather than the shared parent.
> 
> Other way to represent it is to put ethernet phy here - either as a
> child or folded into MFD device node - and provide phandle to MDIO bus.

That would be odd. IEEE 802.3 specified that the PHY should be on an
MDIO bus. And this PHY is on an MDIO bus, that is its primary
management interface. I2C is just for ancillary configuration.

The only kind of sort of an exception we have in the current MDIO
subsystem is for SFP modules. They only have an I2C bus, not
MDIO. However, SFP vendors have various protocols for MDIO over
I2C. So the SFP does appear in the I2C tree, but we then instantiate
an MDIO bus as an I2C client, and then the PHY is then just a normal
PHY on an emulated MDIO bus.

	Andrew
