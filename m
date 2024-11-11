Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE81B5ED4
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731358183; cv=none; b=PJP129BzjLXp6bGv7R/QD/T+m2LT9CzZGFsjjKjWb6o7QGXhhWA3e74ioc2kAAwbkSILUTGDwTjOvoJpwahFAtqEdujATn2/inunB2Z8JWKDPRYiNodn3ekw1LznN5eIAgn42Rnb/wfiDYHCqhuUoSucL2ZYPy4PKzVRbkEjt0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731358183; c=relaxed/simple;
	bh=sHYP6V0fJrDnHZFz5NK/y5NMjVSRmmZ8xbrpg/df5VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lqcbxxz+07lEVUf/otVnEc2zP5gg9CM46pl+3bmNe1Fkr4Cx8vseJbWcE1pANQzHA7p8vRaJyJpPIelLq0SXefzMKl7u0GMXi/rBQzIzrDD1TPBkuT0WxtYPHv82lOcPIOnPqDU0QNaBWhfP7pbwMP0hCyE7ukuwmx0Sy0UPKqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fR8BdtbL; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fR8BdtbL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id EACAA40003;
	Mon, 11 Nov 2024 20:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731358179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYiVjrcxZpTi/c06BPQHiFC8F+p+6wh7EIqPd/zEwtM=;
	b=fR8BdtbLRORymTS3lN4WPxSA0gFafroYaf0+NPUNSYqFRz9s9YIJKoWcRxSyPUJK+T+GOK
	PDAT9kd0OL/+BSkML1RRiHrg4SNAbPz8qapqjynItAHTMXd3TVYuoruuiWfGssEMX05iML
	cRnrz7vx8nSCAK4Moe5i12X8Htm/mFPzVJFflXGFXkk/TumQfEf+mV8hV+RdrV4Dq2OwwF
	WWCdn/CrHb312hihColuJ1DRDDS91iiVj8aUbSV3TnVQgnSg0xxXmEDMwYHYepMgyUkMrL
	Oo8eGycEX9fW4rQCCC6+Sw01fq4NeyMHjov8vfmn3zbwxPiBBQVHeWcbFq8HgQ==
Date: Mon, 11 Nov 2024 21:49:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH 10/14] dt-bindings: rtc: sun6i: Add Allwinner
 A523 support
Message-ID: <173135816498.3301625.12210632932642052880.b4-ty@bootlin.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-11-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-11-andre.przywara@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 11 Nov 2024 01:30:29 +0000, Andre Przywara wrote:
> The RTC in the Allwinner A523 SoC is compatible to the D1 and R329, so
> just add its name and use the R329 as a fallback.
> 
> 

Applied, thanks!

[10/14] dt-bindings: rtc: sun6i: Add Allwinner A523 support
        https://git.kernel.org/abelloni/c/9beeecbd63d5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
