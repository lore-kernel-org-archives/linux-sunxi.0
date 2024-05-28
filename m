Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12F13AD3E;
	Tue, 28 May 2024 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716910488; cv=none; b=gT3eHASGP2tqcgj4goRMfH0K34ciqNTR39/wFJ54mRWb6/W6c1zV5hJKLTw/jfJ0JmPD2czUlUaGkwDH4HXNuJPzeb+g9Ytw5I8VR8Op16btUYWeyG6YzaYAFlI5Dg+IkzEQE0dh8p7kUB12DxfjX0d2tjc0sjYCO2cvd+2ThAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716910488; c=relaxed/simple;
	bh=EXPFlZQ92DzlE/k8O74q7MsaGx8GWWCV3OgjxW7Tbz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BeONDWHQdRItol0PEdCCa+NtCtTzzobqAv5Y8gnrgK0Mbcl9G+yoA7JV2Tlou0JOt4Q64og8X83aN4Jv71qGkEZh8R4zP3Spw5NqXrRosyq2/Fj2+EWlXBwnjT3Wk/IQRbag2dJGRYZZX08+pgm44DSPmkqXRggQKVI4silL10Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5518FC3277B;
	Tue, 28 May 2024 15:34:48 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 6E35C5FA0C;
	Tue, 28 May 2024 23:34:45 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20240515234852.26929-1-andre.przywara@arm.com>
References: <20240515234852.26929-1-andre.przywara@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Fix PMIC interrupt number
Message-Id: <171691048542.672717.17705143784475437705.b4-ty@csie.org>
Date: Tue, 28 May 2024 23:34:45 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 16 May 2024 00:48:52 +0100, Andre Przywara wrote:
> The "r_intc" interrupt controller on the A64 uses a mapping scheme, so
> the first (and only) NMI interrupt #0 appears as interrupt number 32
> (cf. the top comment in drivers/irqchip/irq-sun6i-r.c).
> 
> Fix that number in the interrupts property to properly forward PMIC
> interrupts to the CPU.
> 
> [...]

Applied to sunxi/fixes-for-6.10 in sunxi/linux.git, thanks!

[1/1] arm64: dts: allwinner: Fix PMIC interrupt number
      https://git.kernel.org/sunxi/linux/c/5b36166e599b

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

