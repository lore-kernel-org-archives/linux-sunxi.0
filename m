Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E045EC131
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9098C433CC;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693585515;
	bh=U7IcSk/+Nrzcif5ILllS7Sx3cRSaNGCvHPdUJRmgY+w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tEnq995I/E3nhH0Vvgt1lnUVTT8v5KvhEBpPcEWSpW1hVSH7BoJ1M9We0E2xS8bUL
	 /mRueoBjj1C2ldNAdN3yeOWC16n3vrrHHh45USxIddXNCaxarxcKVJbcp/nRvPkl1H
	 l8ZjUIdp7ChBareTmPru39tCMSZYmqPWQcr3D2a1c9TtBAT+MGxyM/1Mds3P4kPlTI
	 drL1mh/UkVCTkcXZntW6goWBhHIijQcwkn64ub07M8fXp70Hb+BJ24TzWup/BzyMi4
	 OJfQyaQ+Bl/+HloCd/PBzOY1F/yp0H4sIFORWZRwX9miCS3apfUJEwq+qL3b0evo5Q
	 dHGxPMpdc0Cug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E5CBE29F3D;
	Fri,  1 Sep 2023 16:25:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169358551557.8276.8875001900828239804.git-patchwork-notify@kernel.org>
Date: Fri, 01 Sep 2023 16:25:15 +0000
References: <20230807191952.2019208-1-contact@jookia.org>
In-Reply-To: <20230807191952.2019208-1-contact@jookia.org>
To: John Watts <contact@jookia.org>
Cc: linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 samuel@sholland.org, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 wens@csie.org, robh+dt@kernel.org, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 bigunclemax@gmail.com, mkl@pengutronix.de,
 linux-arm-kernel@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Chen-Yu Tsai <wens@csie.org>:

On Tue,  8 Aug 2023 05:19:52 +1000 you wrote:
> The Allwinner D1, T113 provide two CAN controllers that are variants
> of the R40 controller.
> 
> I have tested support for these controllers on two boards:
> 
> - A Lichee Panel RV 86 Panel running a D1 chip
> - A Mango Pi MQ Dual running a T113-s3 chip
> 
> [...]

Here is the summary with links:
  - [v3] riscv: dts: allwinner: d1: Add CAN controller nodes
    https://git.kernel.org/riscv/c/f05af44f6913

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


