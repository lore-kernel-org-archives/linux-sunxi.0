Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7103A21A4A6;
	Fri, 25 Oct 2024 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870370; cv=none; b=luhZpVqKYpTzYHxtmokgiEq1QVUoyrinv5XBOyxaqeJDejDuVArRf3S1/XStMNfD7QUiExnYxtTRNVePY/9cnku8T9eWIJsRwUwyPlHCBDE55lx3tRzHRekI2YokBqhcGe9PwC73TvjzwalgL9G5T7MAIvBJlq0rMHa5BZlZIUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870370; c=relaxed/simple;
	bh=h4yHFR5CfxaWYHAiWca8egMLmsiIuHhN8G97pEqfb88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dFd26XyFqqtwNYYO3vReJ24UMUTzjQ3cy4HFkiQQyNyiyOtgSpSSt42Ndz1A9JWb2tHK5+2KBkgYov3M7nZ3me+TONmV9XwyA2bSCrzDxWuxMgPHqpk07tLm6MorFeAdkTa4p8IOtBk4fT3Iz15Oeh0VLonjU+iN9hDH6GN2y08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E376CC4CEC3;
	Fri, 25 Oct 2024 15:32:49 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 451CB5FA0C;
	Fri, 25 Oct 2024 23:32:47 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20241007222916.19013-1-andre.przywara@arm.com>
References: <20241007222916.19013-1-andre.przywara@arm.com>
Subject: Re: [PATCH] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
Message-Id: <172987036725.732494.12289812969711574519.b4-ty@csie.org>
Date: Fri, 25 Oct 2024 23:32:47 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 07 Oct 2024 23:29:16 +0100, Andre Przywara wrote:
> The DCDC5 voltage rail in the X-Powers AXP809 PMIC has a resolution of
> 50mV, so the currently enforced limits of 1.475 and 1.525 volts cannot
> be set, when the existing regulator value is beyond this range.
> 
> This will lead to the whole regulator driver to give up and fail
> probing, which in turn will hang the system, as essential devices depend
> on the PMIC.
> In this case a bug in U-Boot set the voltage to 1.75V (meant for DCDC4),
> and the AXP driver's attempt to correct this lead to this error:
> ==================
> [    4.447653] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
> [    4.450066] vcc-dram: Bringing 1750000uV into 1575000-1575000uV
> [    4.460272] vcc-dram: failed to apply 1575000-1575000uV constraint: -EINVAL
> [    4.474788] axp20x-regulator axp20x-regulator.0: Failed to register dcdc5
> [    4.482276] axp20x-regulator axp20x-regulator.0: probe with driver axp20x-regulator failed with error -22
> ==================
> 
> [...]

Applied to fixes-for-6.12 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
      commit: dd36ad71ad65968f97630808bc8d605c929b128e

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

