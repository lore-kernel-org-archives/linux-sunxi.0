Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574754642D;
	Sat, 10 May 2025 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746841227; cv=none; b=naoUJ6tGE71/1jyDFc7eykTrFi41wmjgyOmcvSTHBAnzqTfVXP4w1Vq0kCxeYK6916Cckapo0g3PJIL5sb5gOyZokJvJvEVZuAT27XGPo+6Kto8ikcLI5Omm5N186MR/K7kk7LgLS75K0YFbCWdAJtc7BlIMrDs03t8ueIqbihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746841227; c=relaxed/simple;
	bh=9AfJ7AMDM7slKOmhTNzJusui5QGKyM0W8VdvFOAURHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ulBwjzUMMSOXcOnFhaJl4aSYBW2cbqGIL4tJ3Dr4c4DgxFeNS72Sz2xhmbgKdnMef4EsEvff4rUnxjGbqwPPsm96TjFYJ1UzsypSITPHfA2gv1L6Zy/f612k3DSL+HrXMTCljCdFuXQ/TMg2ymQndr477j3h7vPnGcc4cwIIL5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FACC4CEE4;
	Sat, 10 May 2025 01:40:26 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 3E2FD5FBBD;
	Sat, 10 May 2025 09:40:24 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>, 
 Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250505202416.23753-1-andre.przywara@arm.com>
References: <20250505202416.23753-1-andre.przywara@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: set maximum MMC frequency
Message-Id: <174684122423.2444084.8734875070442213156.b4-ty@csie.org>
Date: Sat, 10 May 2025 09:40:24 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 05 May 2025 21:24:16 +0100, Andre Przywara wrote:
> The manual for the Allwinner A133 SoC mentions that the maximum
> supported MMC frequency is 150 MHz, for all of the MMC devices.
> 
> Describe that in the DT entry, to help drivers setting the right
> interface frequency.
> 
> 
> [...]

Applied to sunxi/dt-for-6.16 in sunxi/linux.git, thanks!

[1/1] arm64: dts: allwinner: a100: set maximum MMC frequency
      https://git.kernel.org/sunxi/linux/c/d8f10550448b

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

