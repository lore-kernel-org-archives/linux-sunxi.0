Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02319A28A
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Jun 2024 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510684; cv=none; b=EHu3cexOaCcc+1Y3tgsMrBU+lia1lQA6v736yMEOl+XOMNYpwNvxcYVFwEICR6jxGc+OQ8xNErVqgjawetxRHQ46rLvk0G5Fk8tpR8Dy/q0FdQXpO5F/RVANnB1BSMEUVAUxaspb0CqiMMmh3unS4ov3WqJUHnPqaFUr61mvO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510684; c=relaxed/simple;
	bh=EdawJHuOqiQcN1Jc5GTtGiguPFhxdTyTM6kSrMQxQWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtRsuqVR3zv8L7gM046ESKUdH6d7JDRZriYuoRnOYLX+6wDqL+lj7FsVi0nhX1Ae8LBwSOooW1/IiMI/f4hYxAQHDQP6hWyoZGsVzB9QIUq2wdmmaIaGR6c7krUG5jHX0vnTrAG+mXXE66GEMtJmp83YxOWmGa9bDQC0nmYoBHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso6153640e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Jun 2024 10:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719510679; x=1720115479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdawJHuOqiQcN1Jc5GTtGiguPFhxdTyTM6kSrMQxQWI=;
        b=kPyLIKaKp/sADKtlWKVeM8hXxW9Xfc1XZ1k3PQ2M+5yx8SuHNowstdlrOy8cF8zpiF
         as87zTZm2TMIFPv3iEYsCA+vviWUnlbY9mipQedc0/OyID5COlTTUkCChhPBnXa1sUiX
         Qz4j5o1LDTBtLf6RD1jUk4npa2fFq+1azWfT3ESsjAUrbgNuEXpcySbBtL3fEMilBJ2/
         /QWOSTRjadi+FUq8IdhGZYhddnQLY2LFobLqFSTX+Jhvkllu/kY+Eq+Rez5spzd/kMAw
         6fXojSD52HQScliXfszJ/1ol2HIg4+AAY4I1wyttF5pmJFzoKkUYysyL6ok8cXMf/HLU
         cxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXYK1eylQHkXBef6IKwzQoaRirf/SIUr+D4JgCgfkox5KNLv9NZq01qUXXGA7J5LYgM5svbxev8qR0tb87OoVLLkZ0jOn84Ot1f0Y=
X-Gm-Message-State: AOJu0YyKfp4gCT9ehskIHbvZlKNcYLHF40LnLeL7IiiTx3dgmut/9D7X
	tyIfRlicq423UaSk1Zb85DwvkAVc09FAcjAk0+ehHO36fqntUT0zHukvEOAZ
X-Google-Smtp-Source: AGHT+IH0YS3MCSCKD6CzpYu8eTigs7OC/UQQyAHwWecuXzfmznJiwLTA0lqUuvUv4FOVPaHEhWML9w==
X-Received: by 2002:a05:6512:1cb:b0:52c:dd59:6784 with SMTP id 2adb3069b0e04-52ce183c00bmr11674887e87.40.1719510679054;
        Thu, 27 Jun 2024 10:51:19 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab31676sm3695e87.243.2024.06.27.10.51.18
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 10:51:18 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe0a81dc8so109771511fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Jun 2024 10:51:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+OkKTyaDlJJYdla5BsqIzpAC6xDe7hX5xDUnl+PknSW3u1xxxIVQD5HrPzI48cyvQ5nKe3196rT84H8dvqiz5OB0B/rmC5oXGHmY=
X-Received: by 2002:a2e:904b:0:b0:2ec:2993:4363 with SMTP id
 38308e7fff4ca-2ec5b31a31bmr99240051fa.25.1719510678740; Thu, 27 Jun 2024
 10:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240624232110.9817-1-andre.przywara@arm.com> <20240624232110.9817-3-andre.przywara@arm.com>
In-Reply-To: <20240624232110.9817-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 28 Jun 2024 01:51:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64mzJAKwupzmVnggw30z7ZqquDDL3Fu9gTYpED3aJXEdQ@mail.gmail.com>
Message-ID: <CAGb2v64mzJAKwupzmVnggw30z7ZqquDDL3Fu9gTYpED3aJXEdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] crypto: sun8i-ce - wrap accesses to descriptor
 address fields
To: Andre Przywara <andre.przywara@arm.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Walklin <ryan@testtoast.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 7:23=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner H616 (and later) SoCs support more than 32 bits worth of
> physical addresses. To accommodate the larger address space, the CE task
> descriptor fields holding addresses are now encoded as "word addresses",
> so take the actual address divided by four.
> This is true for the fields within the descriptor, but also for the
> descriptor base address, in the CE_TDA register.
>
> Wrap all accesses to those fields in a function, which will do the
> required division if needed. For now this in unused, so there should be
> no change in behaviour.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
