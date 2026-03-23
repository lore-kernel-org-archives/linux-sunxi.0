Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0762C11CA
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285516; cv=none; b=ELEqUOtPPuWCoj7mZk813CV/pxsuz9ue9U9GsBq/hbbGHs2RjzuX4My28E8vD9uvn+nh3P2rcPkMDLrv7fEB6Xmwes4ukk3M2JibSwry0+fpki1tNOIq+nznrg1pV1WjrR7wl8GytiRZQz/HJ+foFah1i5nfOoyxgkUfkX+4QNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285516; c=relaxed/simple;
	bh=Nm5v7JcVlDEukV8P80SZM5X9wYhOXPQwO9PL60/LKYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8Njq8QFYqdT9ldLw+4aVKVtDYRSzouKl4A7ZyCYqSNW03IBVLBWPGYi8uT582Cgn8vwlMN2j0yGUJn5FyeIe/ZFOqh+Ng08t7CzRt2HLSq3xUFG6WHB9bOBK1Kp86rVyQXNFDNkdxv8xrCba4WA0gjjtboMONEC/oCCpeBIlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so20823251fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285511; x=1774890311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5v7JcVlDEukV8P80SZM5X9wYhOXPQwO9PL60/LKYs=;
        b=Hyo5LJ1ki9zHwMDO8QiZAL9mFqreSK8hWYCi/YZOf+x3R+NPIOzt6M1Duoxg3FU0qM
         Wvmfr6wN7T7iud/iy1/SkXsPMhTn2y+9eW0hTZ+WXLPaHRxX9BMisTzfMpx9UdU+doeE
         QUGJJWq0hzfveEKicMv+MhxWKCOInpbb0e/uamQPdE3embi3LkbE8QFcJGcFyTJtsWaq
         ouzmVx0i64QEp2ViIkxzkS5Z9C2Cx8jtgCDSGctgk3/ln4lvkS2MSccy8741BLAD7VIe
         +IfNrSc4j2vc1CUSGd47eLs5fMDgEhP4tALckhy+yVU/UBb0MLs3F7PXHNeBrDJCkz02
         KpRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZIHDdkArHcd0hxeqm+f12qsEk163GWGQvA5mgZTK8QxC3yVLAPmo4QeEy7TQBwnUxzk3C7qqY75lLjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/q1GcFJ/ihsT2FeCKVTQoMR8Omql6QWSQ04EpLoPYIOTi75kJ
	GXqPC5ZjVfmwbez4p6+NV22fS9/zyXZUT29Cr/2zjTFV6DcXd/tM73GuRkJ7dXVR
X-Gm-Gg: ATEYQzyANM4tiC0uaGZER4QBZ6b3ODUGQD+iEXzfzjglXVkQCy1ds82WuLWwLGiu1XK
	ARfskUoT0NuolsUfhk8OA6k3z02i/5vIngAutYaAe3woNfj/oDU7YPyQJj8PzfzNUwE53vh64ko
	LkjnsHjb0PQIgkoJorxrX45tAz8H3AAilnWaRfKGdAHCEoMeEhwwQ45t7e32qTXQh6CwT+HeME1
	DFyuob6G8p13SSm3FceZ184FcuI+IFjC016bKBciLJoYHokEm8T90XGuSYOq4ZY3l+6oA0eTw7k
	9z72gIlbMMfXOq5AI4IQj1v4CEh+lMs7VG849FQrCx4J6FD4Y9lnTUoZqaLfaMeSnBhULeINCpP
	9j1M4aJpks39Hsa1BGA3QZNgZk0myv2l4gKP9wo/fD1dT1dPykWhR5e0617on86r/3bXlX7fpTn
	3RvTvXmoIZiHh9tSjsfFS07/pGfQGa7X4VQ5Q0bvt+/tNFujT6ibRnPZU=
X-Received: by 2002:a2e:b88b:0:b0:38b:f0f0:e38f with SMTP id 38308e7fff4ca-38bf95e8aadmr37159151fa.2.1774285511027;
        Mon, 23 Mar 2026 10:05:11 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972bbaasm25918711fa.6.2026.03.23.10.05.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:05:10 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38bcda08c76so28340621fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:05:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULfRzOMK0QnYkLu2OFdgegT9SCJzui8JIyAniEx+HstJDywoy5LjmOXkToDeK7LNtNgVL4/ifuZVG3LA==@lists.linux.dev
X-Received: by 2002:a05:651c:25c1:20b0:38a:6acb:eab3 with SMTP id
 38308e7fff4ca-38bf96f3a52mr28930191fa.35.1774285510390; Mon, 23 Mar 2026
 10:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-2-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-2-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:04:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v6564QBo1CHDo4jkdz1PXKHLXAiS_Q5-1QGrh6fEt909ig@mail.gmail.com>
X-Gm-Features: AQROBzDR4iqzNYZJkcCgL6IuYb3DzuKFkSg6JxARTu410NRvFve59a3elCP1SSw
Message-ID: <CAGb2v6564QBo1CHDo4jkdz1PXKHLXAiS_Q5-1QGrh6fEt909ig@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Rework IRQ remuxing to avoid fixed
 mux value
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Some Allwinner SoCs cannot read the state of a GPIO line when the pin is
> muxed to the IRQ function. To access that state anyway, we temporarily
> mux that pin back to GPIO input, then return it to the IRQ mux
> afterwards. This code assumes that the IRQ mux value is 0x6, even though
> newer SoCs (D1/T113/A523/...) encode the IRQ mux with 0xe.
>
> Avoid hardcoding the different IRQ mux values by saving the programmed
> value before switching to GPIO input, then restoring the saved value
> afterwards. This makes the code robust against future changes of the IRQ
> mux value. This also avoids calling the sunxi_pmx_set() function twice,
> each of which does a read/modify/write operation, fenced in by the pctl
> lock. The new code takes the lock around the whole operation, which is
> also safer since it avoids (probably theoretical) races against other
> code touching the mux register meanwhile.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
