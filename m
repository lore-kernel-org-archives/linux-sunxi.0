Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294914A4EA
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Aug 2024 22:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056278; cv=none; b=NQw4GnPgDv9NEVlt6cm+fhbLQg730+dJ4+YEIEbzqw1x2JWzs5I706/yKkWvwlLTsw1pEYS1Qrwns3k8w7RvkrvchyaBQHCJw3xuq3asJ7wOEhXUhAuHxejcsp8o9GQr7ZXKV89V3h75VSwSbDTSGGpmUiTvY9LCc+a4lEbYDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056278; c=relaxed/simple;
	bh=k5WO4QDBBlsQUtbcAzwg6NCzLWWJqOLIFTUVIpEZcoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1gO9aNRlp6uI5CHFZNmGJr+LiLtzLwreshy5KpQBnPn3LNwdbG1bDHSlKM6zNUYt9dP9KBUD4N0Ek5uRWPrNvSmyZbuLL5bmsUJsghJ9Ti5320SKhMscyWuxk69Igmm/dae2hOLRzEfqHaOJjxY0QbNhZc17MHKEMqqvTmSTGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j6k9ryKS; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j6k9ryKS"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e17c1881a52so2569303276.0
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Aug 2024 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725056274; x=1725661074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5WO4QDBBlsQUtbcAzwg6NCzLWWJqOLIFTUVIpEZcoU=;
        b=j6k9ryKSCSe1OdaC+emXvk010iavE1TW8IWCNT8OoZ4uBB1ujfJKHw1g/r+6zV+vW6
         wUVXKL131J8iD3JDLshdILm9PaztP0Cos3RCfBb5JZYTlNOUQOa1EAy7zp/qABXyuTO9
         eo3gtGrZsLf7HHlLEJ6oOZLmjLrbEI7wL5jbDVJWkBFajO2UiU69WnDumKT0xDxu2NsZ
         sGolGW+FbgQ69B8Zkkw1gdWpb7B1hQ7MLrfAOpJZ9A/5GyBtsAYq78n4YV8gUY6JIYMy
         vO8QXFe0Ix9XXhCVVp01ichCi+r4nGyRaxLrisTlbSenQSDX+L6HnxBP7wauYrh3qP+a
         eQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725056274; x=1725661074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5WO4QDBBlsQUtbcAzwg6NCzLWWJqOLIFTUVIpEZcoU=;
        b=S/xhC5n+NkwUcxR3vs9aGEkrrBrf43FIW8oDqUBOe3+6EdlFSBeJTGkI/SC66Xjozt
         ULTmRtR3t0PUmWFOoKMJM3cD1Mwff9uStvtYjic1ndB9E1jUSv46zshoQgP8Qn90uHDE
         zyr2k4pbbCrlKNVw50oGQc+QGzjwKx5BuKJTLt0fjd/yXLfzsRhulAzIU3VVuRt3iqGZ
         EqnJgCi2ei8/ZHwUJ9DSIp9ixManP43wrmI6ePeBOegU/jkZyS7otKZumVkKwsRLNhOU
         nvvLqAufRgF9QtMnwSTyanPwp+B/BUg1FQK8FTyzwmFLbGMGJicR+Q/B1R1EQBB5FBlT
         6IQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6nl3iCpikSW8e3IeHshOCJ8WuuQgpPZG4ALPp49XJu+pzGMioQhe8NJqOXDzpIOD7Avjr9HfahmRSQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKLADSp3gQD1arKW643BhXzKxV1MX0ZhBz2MlmDqtDRiLy2vrC
	fpCSy9izbd3j006QrOu0Ux/rSiSFdcvEjFGHE5Iy1d2F+N0T1A5/rG0cdJ2VJ8J5TQjJOLx6Omb
	GXwSiMnqY5NnMSRcyjVgrt3z8hBFILQxU2RcQzA==
X-Google-Smtp-Source: AGHT+IEmUy2IA6mF/xZvxmao3unx9PJZHOnyHquLRhrCfhleDGsJQGbKCiuRac4ps36sc2viLuEP9uTKmgAJ4mvsDS0=
X-Received: by 2002:a05:6902:1ac5:b0:e1a:7033:73b2 with SMTP id
 3f1490d57ef6-e1a7a3d8163mr3422353276.24.1725056274315; Fri, 30 Aug 2024
 15:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240827075219.3793198-1-ruanjinjie@huawei.com> <20240827075219.3793198-3-ruanjinjie@huawei.com>
In-Reply-To: <20240827075219.3793198-3-ruanjinjie@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:17:41 +0200
Message-ID: <CACRpkdayBQ6TrV0Nn9jWX45YaP6repY0FU6CP=FnubLbonpEbQ@mail.gmail.com>
Subject: Re: [PATCH -next 2/7] net: dsa: realtek: Use for_each_child_of_node_scoped()
 and __free()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: woojung.huh@microchip.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, alsi@bang-olufsen.dk, justin.chen@broadcom.com, 
	sebastian.hesselbarth@gmail.com, alexandre.torgue@foss.st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wens@csie.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, ansuelsmth@gmail.com, UNGLinuxDriver@microchip.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	krzk@kernel.org, jic23@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 9:45=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:

> Avoid need to manually handle of_node_put() by using
> for_each_child_of_node_scoped() and __free(), which can simplfy code.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
