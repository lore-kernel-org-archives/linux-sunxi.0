Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B51B6BB5B;
	Sat, 13 Jun 2026 18:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781374843; cv=none; b=ltW0PLWW7joW4X+s0jh6eLKigpx+z+VHKaisV+3Mhm/Qjx5QapqBJzIZX2qbRty1mYQffpFJJF4tJc/cndLdm8F8TZKeKEo2bF2SzBIei9J4LWlmwCsxOadwk46DohuIdElVwqCVNxX6EdWOBI/M/lLsIobVhR3RNGsYzJVbvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781374843; c=relaxed/simple;
	bh=nkOk4cv4TPBXAIK2hbUa9YuT+bfc3ZuhK2wi28MS8R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRzJR1KZap7bUYMQr06beTQJ8TNpD4G8BZGqWAxRoIulpGVtrgX+LghMsGdmBFjaspj0AqZd7qDRraOqt/kg1MjuZVCG/vhKCW6RNRJeUZ6AENGCivMwVmCXzx5PCx0M6OJipxzBTZtzVaXoc1cC5Qz+F3KdYNzdzPaszd9OODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPosQfqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPosQfqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4791F000E9;
	Sat, 13 Jun 2026 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781374841;
	bh=Eud/G1Fl86jvawvMuS6QTDlOHo85kknsSJQpPdjorBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPosQfqG6ovGEAQl7kMEIPmlaWB93mmNPu0UBJFDzWW7DFopnFsHqSQtrAXJmtFwQ
	 igF5AXPbaCh4RKRdNlG+I49YeBGq0ev3alLzh8NS9JdnBg3RXwPWnGLHjqZfA1kDKr
	 K4XhRA52GLFd+v1GSRbja7pDKNA+7JnpSGPtaJkA0/SqeYVEmdkGHNX3eHAntC+bxE
	 ENv8roG0QneYzC21zP4DT3FMpmW8xe0c6Iwo4ta90ueW3+srF3GjbyvCsbgoR7koy2
	 u5ION/1rilgvevZ9K5+j0Sbk1ixNRXITz0SRgoBSceB9MC1zdYnp7L1+66/oOewUbE
	 CWUKUROpcDLiA==
Date: Sat, 13 Jun 2026 20:20:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 1/6] dt-bindings: sun8i-v3s-ccu: Export MBUS and DRAM
 clocks to the public header
Message-ID: <20260613-dashing-phenomenal-capuchin-5d35ad@quoll>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-2-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613152655.212490-2-paulk@sys-base.io>

On Sat, Jun 13, 2026 at 05:26:50PM +0200, Paul Kocialkowski wrote:
> In order to declare a mbus node for the V3s, expose its associated
> clocks to the public header.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  include/dt-bindings/clock/sun8i-v3s-ccu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

