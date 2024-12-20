Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED1218EB9;
	Fri, 20 Dec 2024 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734720187; cv=none; b=ORCxq0mBYVUjKXiMVTpYj5OKgcJzR4w3gHxoP+4J411hReZ07ZxTLKoxyjmgwogvdDEuHHEnB1EuPcv1F+9fvLPZ24cx26RbsUjxJHKo9SfY8A4G3nw3WB2uzfPBmGDwSiPH+O8qpAClgKFz828b0/qj/ueYFFNGhEHdVZlaKLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734720187; c=relaxed/simple;
	bh=TqGwsnuhWICzxEzQF0wXPiCqcUQUg9ZoaoAUE+gZ3Po=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MRh2J6YKzdwW9oitKkbUoTOOlMDxOe6fd5dRdU/VuoozWwnDT8Ii43tlHre934xwfdqmmtDNDbjVwezcoeTk/iRmsKaBgw59AKV6tHcaEFhR9qBIdiK+dblqS8s30YDR5DMU0wUA3dt47ItpmX5gOciQjaY6Hsl1AJe2mYJL7Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F85C4CED7;
	Fri, 20 Dec 2024 18:43:06 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id A1CFC5FB49;
	Sat, 21 Dec 2024 02:43:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
References: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
Subject: Re: [PATCH v2 0/2] sunxi: Add A100 syscon nodes
Message-Id: <173472018359.189342.4338686387095816178.b4-ty@csie.org>
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

On Wed, 18 Dec 2024 09:01:17 -0400, Cody Eksal wrote:
> https://msgid.link/20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest.
> Only changes here are fixing missing newlines between child nodes and
> rebasing on 6.13-rc3.
> 
> ***
> 
> Here are some very small patches to add syscon nodes to the A100's
> device tree. These had not been added yet, as they hadn't been needed up
> to this point. However, Parthiban and I have been working on patch
> series in parallel that require either the syscon or the SRAM nodes it
> is responsible for; specifically my patches add support for the A100's
> ethernet controller, while Parthiban has been working hard on bringing
> up the Display Engine.
> 
> [...]

Applied to dt-for-6.14 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] dt-bindings: sram: sunxi-sram: Add A100 compatible
      commit: 168b2b355f886db4230f10d24bc109b0b34c4708
[2/2] arm64: dts: allwinner: a100: Add syscon nodes
      commit: 53c54d9b9379e2a3eaec015556a51e47957a8d92

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

