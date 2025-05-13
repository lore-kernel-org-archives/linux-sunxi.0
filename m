Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BD2BEC3E;
	Tue, 13 May 2025 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153784; cv=none; b=ie27qk7DmeaNKc4gmjRM+zS5DHA/eI8v7JCn9YHAG+QLkD1hwnNarWJFfE4P1FaN+c/+iSxmLqOeRYCNPF0c4PKwkGZYsTUSvHP87R/f/BN4hfwlCMRRcUadkYRrgggDeiwFMO+D1Y0oc6xU8WNj6dTm0ZhVFyI17Vip5Q4seHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153784; c=relaxed/simple;
	bh=vz7Pn/6EL4wk60dEMYxwC6EfPtUwu20ENGHawZQo4qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XwT4yLCIjAuJ+8fw3l2AfcBck1PCNPEDWCfiQsCK+pFzMHfHKh7UMN67cQ4OLeh3P8t4E25GFQSRE9ws0T+KnSkMpaLpjWpKF4OIb6J6RKv9Aw3Y2SSpJUlTW+vAQd7sX6S6MCR/JR4wZdlL5e+I+svCBHkYDATDGdSkzBrE0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7DFC4CEEF;
	Tue, 13 May 2025 16:29:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id AB3345FEDD;
	Wed, 14 May 2025 00:29:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>, 
 Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250505164729.18175-1-andre.przywara@arm.com>
References: <20250505164729.18175-1-andre.przywara@arm.com>
Subject: Re: [PATCH 0/3] arm64: dts: sunxi: Add Liontron H-A133L support
Message-Id: <174715378169.4016543.2717785306714546784.b4-ty@csie.org>
Date: Wed, 14 May 2025 00:29:41 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 05 May 2025 17:47:26 +0100, Andre Przywara wrote:
> The Liontron H-A133L is an industrial development board featuring the
> Allwinner A133 SoC.
> Alongside the usual standard connectors like USB and Ethernet ports,
> it contains a number of dedicated JST connectors, to connect external
> peripherals.
> 
> Add support for that board with the usual patch trinity: vendor prefix,
> board name binding, board .dts file.
> 
> [...]

Applied to sunxi/dt-for-6.16 in sunxi/linux.git, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Liontron name
      https://git.kernel.org/sunxi/linux/c/9baa27a2e9fc
[2/3] dt-bindings: arm: sunxi: Add Liontron H-A133L board name
      https://git.kernel.org/sunxi/linux/c/d26382bb852c
[3/3] arm64: dts: allwinner: a100: add Liontron H-A133L board support
      https://git.kernel.org/sunxi/linux/c/b631b0bf7648

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

