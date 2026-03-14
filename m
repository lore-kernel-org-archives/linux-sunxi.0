Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A21427A
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773473636; cv=none; b=ni9MN5OmJd/EtQ/z4QGxX6IWRBtKgUzBLtDbAQg/U5HlPWW+m4mpST5nzY3ivMyc40MSVsudHM6hiQHXbcgNGLdHzkCah1s3jGxZWwV3V9qnusNZVEBwfgaH1jf4N8WS1IIhkyNdl0eOtmT/yf4kigoyYxaCtfoRbiG38K/Pkcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773473636; c=relaxed/simple;
	bh=2hhVDHPdFpoLhFbgRe26hlKwyzjuViZ5djdYgKLBB/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/MK1TzrwO/NVC7Muooq9X4HcFqzYv4EWKyjLnGHKxtURCoRLBcjkTWQhIZMgBOzRJBQ2UlLxRIIUOAX23M8uFrQZRlsZTwrpzpYXLACrGKMALc/IzFtjMCS13DcXWcPkApIVQB2PGPImN/LcV/bjUsEa3q0DrUrb5Bw7w5qrXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a1687f112bso576016e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 00:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773473632; x=1774078432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hhVDHPdFpoLhFbgRe26hlKwyzjuViZ5djdYgKLBB/Y=;
        b=pHDUT0FRHuGZpm2i6NjxA3LWwMKVj6tnxIagaazVqBCMLP55KKI5baz5QNUt3QyEyF
         zBd5TlghNK88yj0Oj0Md2Ooqv6eZyxkCB2cXfuJu6fjwYj8hzxyzKdXQVhQ08RmEJL/M
         lW+NUr4SM+xaClSZCKU/Y0s1tlUu9rbpMyQZxqdW8xoQ9N530rPa7GeSXsF9b+sJ/j0k
         NOhErZtetI0L0u+INlvy7zfN4JVxTHIQ9loK/adK1gJiisoFwNE14rUlyK9qhGLopNt2
         pHhaINDRahynRni1oc+lusbo0ox6ih/4nOU0p24ubvrCzc+OAHYgy8zN+Ge/VQ17z7Hn
         jzKg==
X-Forwarded-Encrypted: i=1; AJvYcCV4szvBeeMqqboFZ6TeUaNK6qjgLswKfE+rQUYN/XmoyqGVOj0IxfvIKIWP2CUCKSIgUaluISRP7NfKiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr5NqJganFvKFUXuFZhgBJMhVTU49XFQZf2Yq+7cVAYgC4SrKK
	0+UseEqDIx42Hq+r6iqedX3KgzVQe1Vg2K5VFqWwIB2csCubv4MnudzXyv7nW378
X-Gm-Gg: ATEYQzzuW8ih/6HcNRzImzkXujC7euXOj/yFogEqM3KaUco64fl9HgZQICuJy83M1PK
	Q8Y+9Feo+QJpX3sUnhvnGaFmCShSNxYUUIS7wiu7KYFxQe98CuosA4R7i7Mp81b8xt+Th5tQKos
	cpO+PXsGyIM6kkY4HkAGCVE7/uzfqIzoUuBYa08fEAs4Ys4oozj36wGkSM1uXy2UYPNNyGsG+56
	qI2ZPg9Jm0+lTcIn8qEuzjQqZYyVHpTicg9c1qo9xtsl0IBKvggFqcRA9odS9Bi1gAe31zS4XUn
	jU1p97uvoFCcM6cBGPYY+sn2QKlEnMGNt5dRZIpm2KIMX6+B9u1A5t4hAvvGY9mANZM94jzYowh
	Eu7o3W9C7zm3oR/C5KhWaMx4shL3VEN7mEd/C3Ts+/nxtVeoYMO+V80e/ln8zd/zBubH7u/4F+d
	U+133ltpsHbKPwNphzykAo0dhXF7IUZAn0BcKvlpt92M4sP2P82uah3Bw=
X-Received: by 2002:a05:6512:63d2:20b0:5a1:1b06:7e81 with SMTP id 2adb3069b0e04-5a162b3b0e7mr1525125e87.42.1773473632116;
        Sat, 14 Mar 2026 00:33:52 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155ee32d2sm2081367e87.0.2026.03.14.00.33.52
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 00:33:52 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so22965781fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 00:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMbqfpCRSvns43a91YL9yLMoUkvNtVnmp4DRx2aiJ/IM/jDDuDwmTXcIYXOucL+0P5hdHOkl9wXUUdXA==@lists.linux.dev
X-Received: by 2002:a2e:8f87:0:b0:38a:737c:411e with SMTP id
 38308e7fff4ca-38a8979c42emr19370561fa.21.1773473631837; Sat, 14 Mar 2026
 00:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 14 Mar 2026 15:33:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>
X-Gm-Features: AaiRm50HgMzViAFsiAKzBuJ21Dl_NGiSreFIiRIGHbKW53o8zq3pm2o3jOmNcYY
Message-ID: <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 10:50=E2=80=AFPM Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
>
> From: Samuel Holland <samuel@sholland.org>
>
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operation=
s
> have the same set of possible addresses, and the address is being truncat=
ed
> from u32 to u8 here as well, so the same check is needed.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Should probably have:

Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
Serial Bus")

I will added (via b4) when applying.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
