Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016858;
	b=AYK88ZXgCipRnNjZ3uJNk3VPLLRXWZf9FQAY5TohrsWu7wk4tRfYkR3Wivr7xMB9NsPF
	 cfiKSuQ6mxDPdTAmMeoAnCNbq3Tsp59bE0V5/ERFgIA3o5WQjAScq4gldKaE5BJP0h+Fl
	 vWlQeSfP/DwIIgcA6Y92uytGy9Sh9Wpr0OVBWxCy/WKDUkwVfOgigpBrqObv8tYxaHHHa
	 u3KE3Es68qmonT6QhgC7ic251uG5PHgZ138jElc6rlDNPiMQ6rxrl7AgdijNDJW41+lx2
	 MQqxh2ii1m5zvOdi4jNr+qxsnznHzGcS6ENzTERMextxlsnMEbzfZtJWnMXpboJR4TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016858;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=JhR61aYjNj6PZ8Va97FkLX9v3sWRWtbAP/NE9nbfsiA=;
	b=M+7+SWaHIZIJT85h7aHCml9GcbSsUyWbfzQ/qz2bti4R1PgHcL2alKlyGrbTNmOcnUV+
	 ZTvG6XOQaDHzAhKB+pJzbNRQnAj1XLl7Q6ZjfEIApjHmr8CEZFahi7dUzPglKyWO0CccO
	 bBA6Q/B1yFR/Cr9BQJ7bc/4AXXxdOxx6wsVG4/rQYFMzwQK/OUqKzV3ujScCnroIFhj39
	 8p5gOxZ4yJORiITj92rozqO5fcGqKmkXrOycCrhgAqrmz1WY+CnLnX1JbaDugGHJXd1fR
	 PFAXVeiPeP4yRZeBIVOyyr/qMT2UW9bQehz6pWyUMYpNcpgr0p+BT6kbRjw9ZgzXUHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6Svp0TQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498EB606A325;
	Wed, 18 Nov 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6Svp0TQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835021F000C5;
	Wed, 18 Nov 2026 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016858;
	bh=JhR61aYjNj6PZ8Va97FkLX9v3sWRWtbAP/NE9nbfsiA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P6Svp0TQv9MlwXEuOAg9asd7uA00k9aOCDZJq7Mxg5UUO7Pfd/7HOiPH7vzIhlHwM
	 mHJLG4wHXrpB3lGY6VJVbBcyy7vwLPTePFDj7L9VufCEbcdHfn3FiaAa7Y8Rb+xFHh
	 4mdmsTz7b9sF59I+HI1UY2lAT4Y9b/0+0ZCITMoc2Nbwmx4JX2AqSHfndG3Oydss0O
	 6u8j+lDU4YGBFDPFtqCW379PkUJo/I7RpDTZ6Va51qgx10f/sJOKqtCZWJvQM5P3Mx
	 W0wEXj2fi/hA0VUFWoEkmsKrGeH+yrVriQ4DdIUCwSTNT6JDFV8AGHE1lATaBTRWzj
	 OfK+jzwVYoM0w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
Message-Id: <179501685630.182728.3865040956316474278.b4-ty@kernel.org>
Date: Wed, 18 Nov 2026 23:47:36 +0800
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 03 Nov 2026 03:09:04 -0600, Rajan Yadav wrote:
> The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
> points, so nothing throttles the CPU as it heats up and nothing shuts
> the system down before it overheats. On a KickPi K5C (A133) without a
> heatsink, the CPU reaches 90 C within minutes of full load.
> 
> Add a passive trip at 90 C that throttles all four cores through
> cpufreq, and a critical trip at 110 C, using the same layout as
> sun50i-h6.dtsi.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: a100: Add CPU thermal trips and cooling maps
      https://git.kernel.org/sunxi/linux/c/90e0d3fd460e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

