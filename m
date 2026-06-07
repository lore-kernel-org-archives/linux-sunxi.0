Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9136C5A9;
	Sun,  7 Jun 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780820716; cv=none; b=h3nSpBNJnopQk3nJfou8d95r40ZdGQFSXhFAr1Nka8dbj2CA4KhqsulbYYV05GgwEo4/82GB0Iz1JwqDYjC4oq4j5/SPC6hhJIgs9SjkyAKpxjOWRA3cPlEaXoI3wio4UKRJfR5xLXQoz2zZ4qCoae7ollk7tq751PkLksfZohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780820716; c=relaxed/simple;
	bh=iCFQk509Okmkicjvm6eKJQtctVoGuJKs9y1T4wGYaiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRomBRe7TPemWf+YtpAfIVB4ajoZhkisIqyNdQkoSRyekuiEIXpWjPAXg/3d8W9evIrrlHvhl7+nbptrKnGR0Mfp2o6qDu6fdoi85xTWKA8MRoZZoEYnmbgoGUXAkNnjPpG61wqIKp8JCPeRixpwjTcRinkBU7YUV9katEewxPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1AO3HCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1AO3HCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4521F00893;
	Sun,  7 Jun 2026 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780820715;
	bh=Nme6DkeNMvq66PlrbVMiDJSupvuXFgDWckEwUU/+8TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1AO3HCeUr109sZRmHIY6gggMQmycclyA7xZscmS0oykzBrzCMZ6wXZFeKi524FOL
	 L4cj6YDmjU+QhZjPRO1rnLc52AE1gAQGyREV015tG6mmECqbgc1UnvoRuOU/mbhgrV
	 GP7wXmQtIJcugGZkqxN1cegoyCoF4KA5eotvE3FtX1lTPbo61XbIof4NDz8aO/nc1H
	 HpNW4pW71edaAZPAQj4j6whEWqYsMqxWouvBJoMuy8FSYBvyMCSKP8JfVbBhTc0L/E
	 BjsYSHG/hbaWRgTUckFdIw6o3uV2EMN0zjGtCOgrGSBtvHMRvNHwlu1L8CxJgqvfqh
	 8QYjQVyHHv5qA==
Date: Sun, 7 Jun 2026 10:25:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: Add NetCube Systems
 OpenNMC (dobermann)
Message-ID: <20260607-fractal-turtle-of-valor-db1c13@quoll>
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
 <20260606205452.2386930-2-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260606205452.2386930-2-lukas.schmid@netcube.li>

On Sat, Jun 06, 2026 at 10:54:41PM +0200, Lukas Schmid wrote:
> The OpenNMC is an open replacement for APC SmartSlot management cards
> based on the Nagami System-on-Module.
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

