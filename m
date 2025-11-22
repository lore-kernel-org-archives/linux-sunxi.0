Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB30610B;
	Sat, 22 Nov 2025 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763774421; cv=none; b=jd6HjJUiVw8URJa8NGiZ61IMiWIGdGnbmcYFiV07fb9x4EaMgWLIOQjDnlb8YfPYoXtOPcPMCv3iRG82BFW/ed4U46ooTms5VGskZgzhDFaT/FYL0SjE+H5ABi6BF5yam53O63rYp+6S4qWu49A0wa0B3B6CDlVsKgj8tiC83gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763774421; c=relaxed/simple;
	bh=VAZ/Zm4cnlcYBg8w2uY2Wf/4jK6ScSKcXM6yymno/HM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bVDdIMnG7cgK+GyJUCn/LqFQHHa1HqWpC3gTgIgy1DT4LFpswJVUwAKUITwQrKEb7YXGkfS2T7JKIZ/Y+F7I6LfscnkMH167p5tjAmn6TltKhiUQcGV1zqemMDO4XAARnQvg1NIY8Lp04exfeETi8JWBtI3a85E0ALWu3aNV5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwcfBwK/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwcfBwK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173ABC4CEF1;
	Sat, 22 Nov 2025 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763774421;
	bh=VAZ/Zm4cnlcYBg8w2uY2Wf/4jK6ScSKcXM6yymno/HM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lwcfBwK/M3UmajwPpjJYJtUBq4B39y7RqUlcrWHJCWhiT8T9cVXZ2vg/F61xEqGPH
	 6eXOmLD+OomZrhIGh7w8nr18f6nFr0PeQIhJ7hv0uYFBvZ9jyGZpvRDUVVqDBUljFj
	 WOp1ixL4+sqKSyOZ6zBPCneUsqkC0RxvEc7v9biNwRH9AjcDx3J0+hseQ8H+bohmci
	 /GsjiCaUKA1o1Nh9twOuB8gCqK1s21De7cW7acnjKDMS2aNbCIwcCoj7N0Ms68Sd5p
	 b51nQU4yHaoj/fGcK51l6IxnQIqV+Qq2m++Dkrhl8E8OEbqtzLGGZWSfhBO8JDoPIw
	 yU1pMGv9RJjpQ==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 488C45FA61;
	Sat, 22 Nov 2025 09:20:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Charlie Jenkins <charlie@rivosinc.com>
In-Reply-To: <20251119203508.1032716-1-geomatsi@gmail.com>
References: <20251119203508.1032716-1-geomatsi@gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: fix vlenb property
Message-Id: <176377441825.203955.5834397117362427441.b4-ty@kernel.org>
Date: Sat, 22 Nov 2025 09:20:18 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Wed, 19 Nov 2025 23:35:06 +0300, Sergey Matyukevich wrote:
> According to [1], the C906 vector registers are 128 bits wide.
> The 'thead,vlenb' property specifies the vector register length
> in bytes, so its value must be set to 16.
> 
> [1] https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> 
> 
> [...]

Applied to sunxi/fixes-for-6.18 in local tree, thanks!

[1/1] riscv: dts: allwinner: d1: fix vlenb property
      commit: 9f393d8e757f79060baf4b2e703bd6b2d0d8d323

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

