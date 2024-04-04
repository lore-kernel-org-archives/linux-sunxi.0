Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF082876
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Apr 2024 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712230825; cv=none; b=fEhofxxOJDau0XIQN3DcWAryMrrvpMoLKu9rvDLKZtD6xN0nSeMezmz+arfJIaJC7S9YRM8ox1ETmNAHOQS8i778FdoZ0kxKLhXqC6cR6sq4qKvxrVSvDh0r9+qkhfUJdvAzqNA9uAJXuf+5JaXs+fjmdZzyYnR18H2f9OW5Z3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712230825; c=relaxed/simple;
	bh=WvmD+zW80mCHMaqxRf0H4QSSZ96J4F1GjnqGYV5LYDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOcajklr6e1k8QC5svDgsKAGpjzllY+InWpJlRD2yCwZl+DWLOjxcIP2kGoHyKjcx9zYNvAm8XDCrhg8uBsyhNGo16QBYlWkGOnoYsVB3ZZt0ntgVBLISzldK+uJurOYorCEl1PVQj0USIcak0HtNJ3jvMjHv73hCaoEmHJyjqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEdCYgc+; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEdCYgc+"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6153e169066so9635817b3.3
        for <linux-sunxi@lists.linux.dev>; Thu, 04 Apr 2024 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712230822; x=1712835622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvmD+zW80mCHMaqxRf0H4QSSZ96J4F1GjnqGYV5LYDM=;
        b=qEdCYgc+7hj/jozLuttl662lQe0ZJCLiPSvhQaJQN1JW/xzvl5VbBWDuKdbEmd9im8
         L1zsb65rbMsxa16QE7yBB7GLei+qSMryZRMk+ytwFWOpgMGHPeX1WmDttc+wkT0MT48q
         0ZSyu22BlxcAy+FdZkYWPbBOm7y7mcAcfQyoV+bza4BFdXXcOChr6SCi5wadHY6LQkEk
         kU7t1iueNkj6ZyZRsncRuQ6W6gcvGoa/9hpaQZtvn0hODTPotC8zCvYM3L2orF+B78nK
         s5OhZNa//bbj5qXw6e+jjtYS+pVuCSlYGYJ39ajk49XoDxgQrTOxnbbiDsclLXG4iif8
         Wb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712230822; x=1712835622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvmD+zW80mCHMaqxRf0H4QSSZ96J4F1GjnqGYV5LYDM=;
        b=n3/HgTmEQDcvPHkHl0OutMCUfee2du6jgoMqRDuIeUfGEEAJKhLtGUJNx1BLRuRgq7
         Vhvo5SGoEp7a3O1blscLpdVCqoCzAtm98iKFWMjilI2sVmm7QZdEcHtjc6vg5AMhMxWT
         czPKK/CJR3efrUK6jp/pcXLjvIUd//J/3VoZCFqNWRUPjD8fGHnyXxSS6vPiZZ2GzuLe
         GcRPk5awvaXKBcsMec5QfjoNq8LeWTd1mczuLjtnkEHzI7zUaqZi7CtiVbCCpwE5C0IG
         wJFiUO0euKFDPBjX7PDfoTjWXbpRukeu63L2N8bjgL+UYh1d/GFLazcLp8h/cXZb8vpW
         WARw==
X-Forwarded-Encrypted: i=1; AJvYcCVe887MYSvGGxq5njKbBFa6dnyyM/EXKDGJQTuGYer0VvQi8BQCXXBJW0YGvkVJ7hRs7r5JgvFPh7DU3H20SP3GVEXAoZ980KM/siQ=
X-Gm-Message-State: AOJu0YyXwQEfs+q3nJuo9KSJl2IoZl8Bclur9YiW/EZgHirHlsucfs+6
	9AxprHzi59cP4s9e0Z8aHNij1QiA+aVPuVwcxO/RHt/P6zdO9IZKax3PP9pScvVtHdgehZMhc8X
	HwBSAktQ3HAC7DL6nB2saPKoFbDuLkpsmYUSrLA==
X-Google-Smtp-Source: AGHT+IGd7buOnq4d3z5iEEVkv54BdiBPBzE/CfnnmwzmaRZinGTBmvb2QLdzwpSE7CR42SbuiExNTwe5Lviz1MibIB4=
X-Received: by 2002:a25:8206:0:b0:dcd:a9ad:7d67 with SMTP id
 q6-20020a258206000000b00dcda9ad7d67mr2503123ybk.8.1712230822049; Thu, 04 Apr
 2024 04:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240330210954.100842-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:40:11 +0200
Message-ID: <CACRpkdZGMibZe1xeEBDGBZKtpw2iDhBnm4W2+Ef+KMMDG5BaCg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sun9i-a80-r: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2024 at 10:09=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
