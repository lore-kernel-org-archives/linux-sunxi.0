Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BAC12DD90;
	Mon,  3 Jun 2024 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423670; cv=none; b=bnYwlCwuWz2AxnFOGPuoAIJfIo3IN9C698xWHdXuCDNSVumUaGkCUmfyUnTr1OamxLNTg02nQa0iR/5Wvy1WgOosfh3FZsOlEUwGiITlr99kFazChmhn/CxpOub2mQDPipR+2LZZ+1FvKHD3h5jwjEqV1jg51A7eH3+WdJMMnOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423670; c=relaxed/simple;
	bh=0HioLrJTT4QG1HtFU+ADQXAnte0yqAM5+oYmYjZ/W9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sBhxLm41LXoLKa+/lxmcE+8+qyBEgIiRuFo/eO3KO8kG9NnWK+QU1q2v9Im7Tygf847YZsOl6W6zhtbQ2eiW4hmOyWZLmZ/1/jjTlQuPIhr/r3FwIix6SZLE501XpwmXz1bLROd2InnhUaN12k16mtXXh26kfvR27aHwXLRbsgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635E0C2BD10;
	Mon,  3 Jun 2024 14:07:49 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 5B7DC5F952;
	Mon,  3 Jun 2024 22:07:47 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Pavel_L=C3=B6bl?= <pavel@loebl.cz>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20240320001152.4077150-1-pavel@loebl.cz>
References: <20240320001152.4077150-1-pavel@loebl.cz>
Subject: Re: (subset) [PATCH v2 0/3] dt-bindings: arm: sunxi: Add Banana Pi
 P2 Zero v1.1
Message-Id: <171742366735.763275.121443280080030531.b4-ty@csie.org>
Date: Mon, 03 Jun 2024 22:07:47 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 20 Mar 2024 01:11:45 +0100, Pavel Löbl wrote:
> Adding support for Add Banana Pi P2 Zero v1.1 from Sinovoip.
> 
> V2: Added Fixes: tag to 1/3 to reference the commit which introduced
>     the duplication.
> 
>     Fixed all issues found by dtbs_check, except "cpu-hot-limit" regexp
>     which is there for all H2/H3 boards.
> 
> [...]

Applied to sunxi/for-next in sunxi/linux.git, thanks!

[1/3] ARM: dts: sunxi: remove duplicated entries in makefile
      https://git.kernel.org/sunxi/linux/c/bba474656dd8

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

