Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599581;
	b=jbLeABjnl/218AgfjcWfpcmpDVYH5t3qv6xEkY1HcbLL7QFp6ttRak1xFrmqeRHRfPpE
	 /9SyrQ4hJ5ruD6d/DHyVCipIimaXGep0H9kQgaeO+dLjSCw++NC110cW0a5gTSNmhxAAV
	 g+6hj79Zh3np1fIAKFMnD69cqa+Z1RVEHeG372S3gjEv5+2mvhPjHmNPbXjwNAaWIsFNb
	 NWvTHoOeMzFJ/ABbVfDoKPFs3RGkTSGhuN2qVeZ5g5v4tQOnDvqTVSjhPa78GLIXTkFoR
	 E9uqgCpL3NgGuN44svUmgmUQG/myN9X8QyZMJNfiUs9bWFlvyv22gJm1A2gxX8/M7Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599581;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=9vEVpcc+CMjPgfA3K0RKV7gMn4uccMUmcMiY9r1X7ek=;
	b=QE1xnVT84fDahPyxnHpbtVAiMFvDMiYfu37PbGsEEBz23Y6j2Ck9sSoK4EcCSrFxR8Yy
	 zU6e1zoKponi4GM0byWBGce7WloGrixKbDT+ulh3Vqj6SqrdbkhOwT/3b/jx/ziyqhfEh
	 KmO0o0oJ2XhrqPUzH22Gs5D5KJcvd6+pqsH5d8F6oVqhnq9GRCmNvJ3WlXKNfRk+q/sMp
	 Bb8hCOIk0rsNPmoz3T7pm2N56XUN/Yy2B1jyN08cAnD/D+KwRi3fuVVX76trPznMM300L
	 ziDt5PKvmkKcEPZOX9FSPFNSC4Dk3dgR2QgLeYNlblOEryk6ZkeM1RgX9ExGf9K+icw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXwCWIOS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EEA606A323;
	Wed, 25 Nov 2026 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UXwCWIOS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F236C1F000C6;
	Wed, 25 Nov 2026 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599580;
	bh=9vEVpcc+CMjPgfA3K0RKV7gMn4uccMUmcMiY9r1X7ek=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UXwCWIOS01qGj+UIsssVHI7bhbXNBlUz78diSCRTRB2X0+YFEwgSvXuGXCQ7f7uWj
	 wSo4QsKsnEQl3CbR+ymgxRB7cQBer07myWtCJMjYl+DX/o2QIfVOGz7fpnHzO6KsFi
	 ZZHbR19gM2cWLYBHUzTDBBM/QLmpf5AjJs5/3nIe+v22rpR/w6mcD48BMfaHV3oPUl
	 UhjFZ1/blieuU77eC7AlOwCb8l0Bqu31W2BkUb+qumTBsz6PqoFfOt6SDsx0ZHXpld
	 qa91Wp7YeKbow0kLLLYnS5Ygkn9joLA7r804Q24RjFks/VeZD0MYY2M3+U98WC78Qb
	 NJkljj6AB03rw==
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
Subject: Re: [PATCH 2/4] dt-bindings: arm: sunxi: Add KickPi K5C
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rajan Yadav <rajanyadav0307@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261120-k5c-dt-v1-v1-2-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
 <20261120-k5c-dt-v1-v1-2-d9681df67bc0@gmail.com>
Date: Wed, 25 Nov 2026 10:39:37 +0100
Message-Id: <179559957767.14607.11625854653378888.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 01:22 -0600, Rajan Yadav wrote:
> The KickPi K5C is a single board computer with an Allwinner A133 SoC,
> 2 GB of DDR3 DRAM, eMMC, an SD card slot, Gigabit Ethernet, a Wi-Fi/BT
> module, USB host ports and a USB-C OTG port.
> 
> Add its compatible. Like the Teclast P80, it names the SoC as
> allwinner,sun50i-a133.
> 
> Claude Code (Anthropic) drafted this change and its message; I
> reviewed it and checked it with dt_binding_check.

Drop


Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
