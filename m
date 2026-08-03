Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B3257824;
	Mon,  3 Aug 2026 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771593; cv=none; b=RSAtzYqAwXxVwkpmefQ/8nQ9yjawPJiPWo1iYnphM3ZB0pCqr2Tyfx71LgIk9+uuxZUtBOH/u4aBc5YE1ypUwExOq4GKO9jDPMtwUl7aBgdTFUPiz+iddfADGPJB98MnWvdwV5uGFlybuKSXMwx6DVeKSPUSOQiPxYurQp8c8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771593; c=relaxed/simple;
	bh=IurAYdQG1ByYFZFST1lCHoUV8enPzMJp6fIaDTrr5YA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K2DlNt19D6uNSAXBuT4ThSjUPaVGMdVkWZjmZ2Prs94yQG9OiY/MlZgGHNGpwj24yczAz6Oc4DWJNM08R18fjK1nIhwul2nYv5YuXB1eu/Ea2KT/qPqcgYDY0d+pZ+LZdhjEjIEAYjHQrrE1lgi1JRLKhVNcKc0eXGm5J+pHCqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auNkpQr2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auNkpQr2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2191F000E9;
	Mon,  3 Aug 2026 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785771592;
	bh=K1Anpk1sWGF7qGG7jkBwNuEdhAw/9p76YBazLlQwt6U=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=auNkpQr2cZq49Gh2QV+zNxEAJVjfT67rMikbY5lopbtmgYOxy78bXPnTrEgRuglld
	 lnWwEjuw0lcSnPHG7MD+cZskGmWU4VosEAtaKNMR43l010Ume1Nln7zuiBaBnLK5BY
	 MQzBEaicQQFVhD3UB1sc/NzfHMVdnqRwH4MiaTRAsrrVw9oeZXkBUd0By2JPhhP4PP
	 JT2sAN7wJnLEGv6ApxJ21RmXptpUYE3XDSNalE00nqB1s8DANOFZgDu+T6H0z0dodZ
	 oiCZFS5m8KaNtLmHBL6hUqjV+stmmGA0F4ROENXDLoElV+joVyqzpKr8wM9o0nLQHk
	 sjFAiBmka4rew==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210450.384087-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ARM: dts: allwinner: Correct white-space style
Message-Id: <178577159063.2626194.9143791233078359389.b4-ty@kernel.org>
Date: Mon, 03 Aug 2026 23:39:50 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sat, 01 Aug 2026 23:04:51 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double before bracket '{'
> character, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> 

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/2] ARM: dts: allwinner: Correct white-space style
      https://git.kernel.org/sunxi/linux/c/4999ba58b600
[2/2] arm64: dts: allwinner: Correct white-space style
      https://git.kernel.org/sunxi/linux/c/be145483f8ee

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

