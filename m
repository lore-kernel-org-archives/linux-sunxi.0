Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F7F353EE0;
	Thu, 13 Aug 2026 06:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786603783; cv=none; b=iIiKFTeWTzngZtib4Lke4WiDPKV/gsvqCGZpu4NYinSMUejCjaoSoNSFkKGhXyw24xHJFSxWXwennX37e+529CPY/K+r9UUyknDnRPliy868KqjK6LmequUtsyAsOM25TgSQ3LRjQvMJL9EjJlsKJgrTbTdDSNMRLG27av+t49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786603783; c=relaxed/simple;
	bh=IgfvYGsDONV7SdkeNfoxBKJGz1LY+WTdARfP/fFVGYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI8trhxdAVGxu2FhQCjZVg5nzIKZ1F//TtxqT1YJsXG20L2I+h+28ONHF5sonDt92S9ro3E3fFVqpxnkyPViq/RrwVpPLEBqbSlcp0cH+uy5Jky46sdkyspkWvy3PqbP/B5oYggAuwefuOgoc0HbbK65EzoTR7dgYhR9lBFBKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtIMtJ64; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtIMtJ64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBB71F000E9;
	Thu, 13 Aug 2026 06:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603782;
	bh=Ra++R/iBXxsuHRo7JR23B4UlsNDyGkoS3vY7G60sCGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WtIMtJ64WuXupZ0NP1l4LD62+XYTaU5ztpn5OFzJRy+7Tlw8BzAUR5nYNHoW+oHDS
	 g6gKPkX67ELSHNV5YzBPFVLRcAa+0FfbD+/rgy0FOVM5aAH6kyDT4u7JQjei/CbTLX
	 L+rPUQQKtShP7NaoSSULfIvwWk9zHNdM23aAYLmP8qbJZkOZUvP310ZU+JQjKxJlwH
	 1OSh/9YoGwDAMj09nRZtJUDFaIipoXQhsf7F4rg92oj5sfofcPWNxvv5r0ARHrwkWb
	 w0BeBE7XY0BUzTlndnrK3BcoqZ5YaOaAcrjQ0SyAu/XEkMFEaQ/9uUOKhIRx7MI+Cv
	 PYdxJxDIO47zQ==
Date: Thu, 13 Aug 2026 08:49:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
Message-ID: <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>

On Tue, Aug 11, 2026 at 05:11:30PM -0600, James Hilliard wrote:
> The AC200 is an I2C-controlled mixed-signal companion IC containing
> audio, video, RTC and Fast Ethernet PHY functions.
> 
> Describe the parent device and its shared input clock. The Ethernet PHY
> is represented by a PHY package on its MDIO bus, with a phandle back to
> this device for access to the package control registers, so it does not
> require an MFD child node. Function-specific supplies belong to their
> consumer bindings rather than the shared parent.

Other way to represent it is to put ethernet phy here - either as a
child or folded into MFD device node - and provide phandle to MDIO bus.
We do like this already for several devices for I2C case with "i2c-bus"
property. Here it would be "mdio-bus" for example. Such solution feels
more vendor-agnostic, easier to re-use, however I cannot find any actual
arguments against your approach.

Maybe Rob will have his preference, but this looks okay for me then:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

