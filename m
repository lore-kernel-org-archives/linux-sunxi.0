Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1B35383
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752257722; cv=none; b=V7GqadDlteauySL245hYLJ0918BJW2jXrwQ/ibLZXhjf9eDeumErJQqM2Bu9CHVC/BqfYgmrBMYNI/U6+9yobo6fmH65SQzrvRGYNbzTrvX1HOd1r097UTIBSsZwoEPFmwiJuffMiH+i1TSJtasbhvtMpPSjO7jWGsSazIeUcuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752257722; c=relaxed/simple;
	bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGVJj/1kZhY9cE+F1oP+TLLo7OShVyZe5+0nYpb/AEoZ+yFgQ8Ce37job/9+WirgbOsuGIH0kpoXeFZnk6moNemGH0INwrDECTsZlQ1zRxXVdtcTgOQMeQu1xHKUzSAzfxyfRqsAG4t6zjUO1rt1EMr/WphSTNyDcgG3easxPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vfjUqRiC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vfjUqRiC"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b4876dfecso35474611fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257719; x=1752862519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
        b=vfjUqRiC3xvddPPUGUSEM81XkMDB8LKNrPVaRkQDCe/DELhBkEX6YqGRjLIsDwrnfb
         pmPp1PNXqgq+geiGZixdFEmnnAwxUWp2RaUOaCpehbLjG8k0GfC2+Jv6zNm0Ytpdwr9m
         4UMV6sWpgfp+cx5ISu0Du7QIZsDleLbpuL4xgML1fJYtH+j/M6/b3107WwMbPJBkTNZL
         5w5jcpLGzzwCxsA9qpXeAEu1IUx6MEUTY7ay3nCvWIT/JJZcDB9Pi/qmMVmJM63WPzxK
         dhKm/ro9XWAk+pj2++QT1Wxam+5+ijBVLwmxZaJ5RR38+h6lrVValJo6yFG+bNL8oH7E
         4DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257719; x=1752862519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4q8ecDX3sUGA1MLG8h4tOnFmYn0XuYJcSIMOO9sLLY=;
        b=ZMPEV9AHkYCEhLyKHDQXN1f5QwHALCf8lPbFQxbWUeLfeiaaHVHJXe6pf4tiX9d8n/
         +OeifjkMCXQnWhN9FkI708+l3feqS/UGOyusfSytp0twlGPbnyIh+koe5kPT5/KPCMrp
         sG+PojAZAMEvQjPNp2KgkCtJaPvgI2qYT0jJQQDIgeGwGQqpm4atnpS0H/5/rct59kAB
         C8oKCd4lV74q7JTewOLSN1hsWZ9IiI+GP7A9Ukmpu9HXvNEGg+sZjbfe0YQfnlleQYfa
         tCQX+w/9D7g8ajdxJ2uGC1RhBfBsBFt1YPgfyjZgztUdB73Haha3O+38ap8W54GOEYND
         M3pw==
X-Forwarded-Encrypted: i=1; AJvYcCUe7wyK7JkUUo8e84iMTf1OC+5p4dFjsB9yVO1ALeZIWZWQ70cuPMqLe/Zyj7ODfMlBszfoDgLzkGuBcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/yygH4My1ICQM5hQGnJkKneuBgyF19bdhNmTG+OkM5nOeSaDA
	u+o/pfqmnN/rS1T8WiNrKBWtbBA2conSGYDUxPl0Y7kmKORwdU1Dv0q3U1R/i4t/w02ZJ9nFYd0
	6QuK3JVQ8RH+71qNSqTaWz9S2oZLeagSiq4IAzrav/w==
X-Gm-Gg: ASbGnctgJho4s9cICHPIWnhPG5pL6wkVwSVUe9lgXUywtzM/HpBSbUvRyjmNbtaCYYC
	pqxIzHa7jRm6OgYgrqAxYnFYfsS3oZlWgTRzUGUopmyEq3O8YuOtDyOwUT9nWbhYcuZ5dFqkTLc
	UA+gnOHrQOMi2sT+BNR9oT2yTshV2NoNqkg3PJS6JagTgSBSbGAA8zEsqZhOj5Ecr+MI0Ra9igp
	6xsmitazAlheyfmkg==
X-Google-Smtp-Source: AGHT+IFtq0bcfpLwnjm7lAoyNxi5hVnB1TfQxkFuJUC5AXv/cwm7YJlwpXzO1clCMxtNVbmVPeTDx2oSZPEXUcqu/sw=
X-Received: by 2002:a05:651c:b0c:b0:32b:968d:2019 with SMTP id
 38308e7fff4ca-330522ae9a3mr17428231fa.18.1752257718550; Fri, 11 Jul 2025
 11:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-2-paulk@sys-base.io>
 <20250708003236.059ba94d@minigeek.lan>
In-Reply-To: <20250708003236.059ba94d@minigeek.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:15:07 +0200
X-Gm-Features: Ac12FXytqUPkCHhoaHentXWpf1pNxNpNZTLS_vr2xp21e1XJ93lgB-y8FM3uD_g
Message-ID: <CACRpkdZjbGLiZYLYxz5UoMXyuhv7vBipy7YRkhMYUfZLgXr_ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Revert "pinctrl: sunxi: Fix a100 emac pin function name"
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 1:35=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> > Fixes: d4775ba60b55 ("pinctrl: sunxi: Fix a100 emac pin function name")
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>
> many thanks for sending this, it looks good to me now. I just wonder if
> the original patch can be still backed out, I think it would be still
> time before the v6.17 PR?

Yeah I just dropped the patch :)

Yours,
Linus Walleij
