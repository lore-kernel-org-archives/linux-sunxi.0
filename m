Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599559;
	b=NnqE1kV4aTzwm0YjYJHWr5oeLCpYtD7x/8Oy5mWvvMgXNQug+Z+pdG3MKDzQYsqrGqPc
	 NDe6gyJLixNwt5whw38zL17eIh48gtbEUKPWre116BruJQtOUWh0RCkW0KCWh9KktHgQK
	 E2Pk0wlNs3Uyjb1/uGR62ic+kqc3XHE4ANA6uIo2bfZP2j1T+o3cT2mR5H7KWPg7jryHP
	 4zWQ2YuwBixEulBMBdDdd/SVA+d5YPALEQ0Onk73sxu+asta8c9GwY6bUK6lDSZGQk8uM
	 WJjSxbbrrN4TCz8NXq96rhpi8roR+o/BGN/5RvtNqDqy9rdUenpH/KyBxaUbbxLQgUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599559;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=OQFkytMxe9WQx1OI+p45Evfg+nBuhBH5a9ePOSdvAXE=;
	b=dOPLHRXDTWChtf8MtMMpdoNqB5Zy1mFkHH8t8kdiZ8nx+06y/CFjdFVutyHJCPqCqICU
	 LVL8QEhgG30by9tl0r1obkcf2MhNbZbe4Srwo93rYkTumAfUUESjyfta288BRjkibdjq3
	 +iL4aVgT2SIoscAZhYZRGL4vD0TgE/UkYGOwLT6fvn1SDQQ8rrsgrjxATfVe8A73C2hVO
	 KAneRqqQhkKatbkiO+CPP2TCxKXIptDeMoiKcpdnBhYlgHHrKmrFaDqLHyl37hQ78Gz/F
	 MQQ7Pun2gJbJUoqlESZH3N69mWD6hlcshrRgYF9A3faXDKLeJpoJWjokFDxPqXlX8nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fALh60s6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A69B606A31E;
	Wed, 25 Nov 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fALh60s6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68FF1F000CF;
	Wed, 25 Nov 2026 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599558;
	bh=OQFkytMxe9WQx1OI+p45Evfg+nBuhBH5a9ePOSdvAXE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fALh60s6DnSj7LVmmSRzARuLwXAu/kI6ZErhU/uUlOKB9DrRxHe8RM36SJTysC4PA
	 FZK880n6hGiQ7gBEf4Jm6Y1hVOJ4dKwogg6h5BqkjXXv9EAKgf54E02uWuHmOjtmBu
	 PXIp7u5oxD/dZ7nFgp6EIHtX7nIDrCMq72i7TiFjJK+q2EN97y6Mdk5rNcPV5GDIdY
	 NDFhfkvT7u7HEmlhr22S4q4VXsR0wNV81h5PDOCeeBXvnR3+3AhY9V+mk9tB5Hj1n9
	 X62mprilj7uFPpAR05qSG6yNYAaF+7YD5PxS1eZCqCIi7utP7n3o6b791f6aqbLMV3
	 or55zmWbWyh8Q==
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
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Shenzhen Kickpi
 Digital Technology
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
In-Reply-To: <20261120-k5c-dt-v1-v1-1-d9681df67bc0@gmail.com>
References: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
 <20261120-k5c-dt-v1-v1-1-d9681df67bc0@gmail.com>
Date: Wed, 25 Nov 2026 10:39:15 +0100
Message-Id: <179559955560.14607.15069373113329195417.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 01:22 -0600, Rajan Yadav wrote:
> Shenzhen Kickpi Digital Technology Co., Ltd. makes single board
> computers under the KickPi name, such as the KickPi K5C with an
> Allwinner A133 SoC. Add a vendor prefix for them.
> 
> The company name is the one KickPi uses on its documentation site
> (doc.kickpi.com) and as the registered owner of the KICKPI trademark
> (US registration 7747802); their e-mail and web domain is kickpi.com.
> 
> Claude Code (Anthropic) drafted this change and its message; I
> reviewed it and checked it with dt_binding_check.

Drop, this goes to changelog.

Your patches fail to apply, thus not tested by automation. Dropping.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
