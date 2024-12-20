Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67398218EB9;
	Fri, 20 Dec 2024 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734720186; cv=none; b=P+/ARdvd7uaM0Vzlbab6Xs+HnlC+ETw7ie8RNTf5JZ7c5bIeGdfnOSZp4OQtmqxiliIiITSBAJBlC7XlJyCbzOboe52Cm6Yksf9Zkh8gWA64qTZu6hf01cDcOH1iU4oOHZwT+oiqDGlWvVU7huyTb24YTC4h4n+GnIvFjm+KXV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734720186; c=relaxed/simple;
	bh=PxauyW3L99ei2Fy4aP90Osu0n3FLvd4sOrUQKrfBD4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mf9ZyObXTTmXTpVoa6QnluDbmf5viH3pqpCGcrDnJAI9/lK1Gv7Le4eGdv+oOzf0XKTpA38KMcK8tVI5cObFnPin7FHop2c1KwETZ8zeMJP56I4mvRbTPAUBAz/4wM5b5AUSfqt0G1RVAko8YXXzleeichg3mldReO5BQjAJfMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215F1C4CECD;
	Fri, 20 Dec 2024 18:43:06 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B587C5FB8F;
	Sat, 21 Dec 2024 02:43:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20241215212533.12707-1-andre.przywara@arm.com>
References: <20241215212533.12707-1-andre.przywara@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h313: enable DVFS for Tanix TX1
Message-Id: <173472018373.189342.9184547368106297153.b4-ty@csie.org>
Date: Sat, 21 Dec 2024 02:43:03 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 15 Dec 2024 21:25:33 +0000, Andre Przywara wrote:
> The merging of the Tanix TX1 .dts file overlapped with the introduction
> of the CPU OPP .dtsi file, so the TX1 wasn't covered by the patch
> enabling DVFS for all boards.
> 
> Add the missing include of that OPP .dtsi file, to allow the box to run
> at up to 1.3GHz, and enable power saving by using lower OPPs.
> 
> [...]

Applied to dt-for-6.14 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] arm64: dts: allwinner: h313: enable DVFS for Tanix TX1
      commit: 300d7208ed783df828d26196f0105853811f4af1

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

