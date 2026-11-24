Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539374;
	b=teE4xKbdFvjBiSGLEfz/+8bDehFxa94ky+TiQtCGTrcqIY5DI8Y1OPLXJNfLjL2RD4Qy
	 UAKreOc6wgTXNVGHqfo2LGsYa3keNjb3JubzFh1lqoUWVc8c8dQIfeXC+xnj4m1Zb39q0
	 C2Wm4AKNFlQK8Vvj/dm108wX7Uan884RPBtZyNcbiCjr8HHJuCXk4+TQbm9YTWk/bnBnN
	 PF/O7lEN9+Adu0RVtbOqTvZOlqQTNgNvEZcMDqJ+LCf0d43LD38qUA4OvFi7BUDSYSx3g
	 WYk5VZE6vXw/dZwlJXyI657Do9GyU6DR2SysaUiT27Tm78BWp8KnnpCfxbcxgzOHUGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539374;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=9TBfIy+kK+77B0isGngbw1NGhsBOgn/ifky86nGhGbc=;
	b=QCofBvffz01BHjlsTPo1c+ClCRvhNkfRkLI7NRbAa5LSFkfbhJnOhVQDoY4wKFhCYKse
	 MZ7Xh3L3JaqfHRJWxwkfaxY2gZX0uiQxEEe6J2zZOUG4F6c9DY/ZVMrY60XBUZBY5z5G4
	 ZdEDgYBD0bxQJuEeI+yK4ZCa97ydzNkZeTRze57/R/ZQWcxTwCJ0DUwESFhEGheCXDRdA
	 ZZ/917LO8NxHeGjVyy6QUaSHpwAQZ94Eby+E4k4yMNJx00kk+LAj+V4P7tEJ5GMgZt7QQ
	 XG/xglS+nmTVHO6tT62TguBT8tTbJF+yu3Evf0aDMHmwYAEMPI20oAPWWlVRZ0teEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFxmBl5E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D9606A326;
	Tue, 24 Nov 2026 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFxmBl5E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC3A1F000EF;
	Tue, 24 Nov 2026 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539374;
	bh=9TBfIy+kK+77B0isGngbw1NGhsBOgn/ifky86nGhGbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YFxmBl5EzV89wJN6vncSzrsEoO9kIktr6wbeWkTriaKC2xxeWJNCzKPwAFH7wO623
	 gXNzM91BblG/vsRtofynr3Si4G2ecE7qyUVkjH5d/DAfarInZLv8Cb3J6p0CQysu+N
	 aA39U4QVly5DLpBkyYxD2Mg5UeKQl6VPCAl1AXLNm4EUdDXCxb8bu39YYdz+s1LgPk
	 pXTzrJVAzZGx8UHFlMys5zAujkkx6fNWK3Jst3o+3HgAbqx59YUD72jnm/5NI8gWRP
	 q9TZp3WZlkQwON3OQARNjU/RxC4mt2a6vtBTsnqYe7b97zl8i4eOL51eEDM0ayt7er
	 3peqoLwd5MCZA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
 Daniel Drake <ddrake@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
References: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
Subject: Re: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Add PHY
 enable delay
Message-Id: <179553937193.1403078.13673574694751006977.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:11 +0800
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

On Wed, 18 Nov 2026 15:42:39 +0000, Daniel Drake wrote:
> The Motorcomm YT8531 Ethernet PHY on the Orange Pi 4A was not being
> detected: its ID was reading back as zero and preventing ethernet from
> working:
> 
>   dwmac-sun55i 4510000.ethernet eth0: cannot attach to PHY (error: -EINVAL)
> 
> Add an enable delay to the PHY supply regulator, as was done for the
> same reason on the Radxa Cubie A5E in commit 7076938d20d2 ("arm64: dts:
> allwinner: a527: cubie-a5e: Enable second Ethernet port").
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: t527: orangepi-4a: Add PHY enable delay
      https://git.kernel.org/sunxi/linux/c/dd889887f868

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

