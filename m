Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C080D14A611
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Sep 2024 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265391; cv=none; b=ev5n09NOrcbadAvjLj4tlVEoQ51CDzPveZOJjnXCtOZz5esNd5Zx/ZIxdTuBg01L8LNv8UCBzkLgnIDM65EWYO5MaI+LMfckO4wVlzIMmX2RK2j/AGf52LATjP17xdziRCQLm7wOqA/6fzSEqZT/EIF8Q4x/8U5CweXbVmcTZ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265391; c=relaxed/simple;
	bh=XQq/D4lV27FYzTNjf3gFkYUSIKcxiur4dtzJLIKtst0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgZcP9oYCcbOKsEJlf8O1etnhY4Ka7LVDG3RmURZhIownhAuEM3Y+5RC9xaqdxTow/REA45O6hGDurWPtP8GHMVlWgWpaurk3kPQ/2Y9c1pyqbb76uD1mZCcV3xdnsmZWl/SZ7epKbJR+8Fn+j4aFttVb6nJCTAyyostsraYLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mqEJ88M/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mqEJ88M/"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3f0bdbcd9so45761171fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Sep 2024 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725265388; x=1725870188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQq/D4lV27FYzTNjf3gFkYUSIKcxiur4dtzJLIKtst0=;
        b=mqEJ88M/ymyvqW3J9CHaXoEhg4LpIXkk+fT8wJnwB7PkTI5zRGax+RfBPxfkgvP3z/
         zbAKZqSoirVtpOWdGzyH0U6mUgFD/zb7LUqR+TA220TbCFue+zeDofisnvWFTpwjofMn
         bGXuQJMlhk/KrS73utLJAKAyrxe5y0HoX5OfU+HXR5swrRyjngc1cwNl4aap9Zei06g9
         oCLtU9HjtW8e/UZE5naiie3N66UugHqAFh6DLr0rfYgwCN9Sjqe74rzwPqBMZ+hv46ZI
         0/vst86Kk8RdivSoP1qaF3JvEhYiHJqxv5uYikmnPYaDQmDFm/5IeP5SRyX9wJWOqPA7
         /03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265388; x=1725870188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQq/D4lV27FYzTNjf3gFkYUSIKcxiur4dtzJLIKtst0=;
        b=a/DSZNlT4IPhbFvix7aCZd2PEL8d1Dl1EXgt6fWYFzDpNlAviUBCcI9/InPF8zca63
         80TdTNK/4k0+1oCmN2q88icjDnsiWsxkpZrHRZ8TfPMHhtoptj9PrV4omjINEoeMwbO/
         yeJOKpLmCW2/LwWgWWmy9EfJvpOaraMTxoic7S4jDIKY6+q2IeEsTMUEYDvh5oFkvKcb
         tKti0TkugtPZa4QKHK/FnsvVr9Bkyx1JMROlZJr08WytPI0/cVmqa9a0vbGEKMVi7Fsk
         odyxSAfteYiKo37TzNJdBW56i8XZd9yMa6OM1o1U8CDwpDsJuClX+i/k2kGliVu50qTp
         folA==
X-Forwarded-Encrypted: i=1; AJvYcCUyjoVIUAAEPTBzegWURYlR8WgXKdflKOXvghInX848onDQl4CuWApuZHxxXMj47vfStq/Y7OQad21bCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEIWLQToFEVjwYrJzFTP+018ASeHzkQY2uc9uypSed9Ol6du4a
	JZdRM6u0gmurr9RAPawap3iw82hemkhfSRL044DIKbdEGxpSxkf3K1EQYiOiu4/Jk4RTfQh3CuB
	qwLqgwej4jm8KFIlRsOOg7Aw5iLAlJjlU3CTPfw==
X-Google-Smtp-Source: AGHT+IGOsbWk+h5fSydwDiIytPpQSxAoU7GXpQxygF+8ahTjkzoifYF0BEllNauSFfQHoLbA8weKozExCyYDDMJzjoo=
X-Received: by 2002:a05:6512:b94:b0:535:3dfb:a4fc with SMTP id
 2adb3069b0e04-53546b0548dmr7633008e87.22.1725265387226; Mon, 02 Sep 2024
 01:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240830031325.2406672-1-ruanjinjie@huawei.com> <20240830031325.2406672-3-ruanjinjie@huawei.com>
In-Reply-To: <20240830031325.2406672-3-ruanjinjie@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:22:56 +0200
Message-ID: <CACRpkdat9Y0vJXUbBEeoNP7QG3UGRTU3rOYD3PAi4frk05bSKA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/8] net: dsa: realtek: Use for_each_child_of_node_scoped()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: woojung.huh@microchip.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, alsi@bang-olufsen.dk, justin.chen@broadcom.com, 
	sebastian.hesselbarth@gmail.com, alexandre.torgue@foss.st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	krzk@kernel.org, jic23@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 5:06=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> Avoid need to manually handle of_node_put() by using
> for_each_child_of_node_scoped(), which can simplfy code.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
