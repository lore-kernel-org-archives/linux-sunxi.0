Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3801A32AAD0
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Oct 2025 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050545; cv=none; b=Y0JWUvMVXJxnz8mJRuN82G1wiK2nEo05GUxY9Ic90CTcXULs67x17WWIF3IF8Fl5SfE7SvIPVyDzVaEIdkY4LK/rh4QETrofB4eL7ayS7s2JrytBUh6GJRO1d35iROTseWIQ0oPQlYwKqf0enS4ZgQdrl2ergtN5fI7S1gZm+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050545; c=relaxed/simple;
	bh=i/TX7MEsAkgjubTCatvjPm9vWeY3Nm5rFTIQuQTOHOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLtQ/DEw97UgUHok1R3UApnd4048XSVLGDNkJ+mzgS7PLxsE3aDUt91fa7Jlo6C9XSSp/xM/tFsStuv8c1Vvjl/FAV1/RSDuO+rQOyCBgO/X/f4GHDHs08JpF4cea381oRDzDRwoVTB3KAuQZdF3HgE1Yr5cqx56Eb6Q22Gpj9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Tij7WjwN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Tij7WjwN"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so6145068e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Oct 2025 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761050541; x=1761655341; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icUi6yhGBFPCJDF6YW0uPghHiBtXnlV2bRo9arBdueU=;
        b=Tij7WjwNElf5TOhnxmAJeplDwr6Kc10FC5iiOJ49+9KtLx0iwHN48JiJkR6oguSqEK
         jj9rDcsPusmYM/NE+p8PwFe4Z6cWIyw0rMsJzgJF6x+zu/PH5FaefQBAzkSIvygngXqn
         i1lSTIyflTEw4X7BzxHfiJl+AjyAvBSBMGh8SEUgf3IWCmqERdUxxvJm0QUHXf2pP/sA
         Rpy9rzLfretRpzqY8Ulg/9LV1B0wnUcIL3XWP5oASy7xvrheMZYHrnc6z74cUwT1kKvD
         AE8MhGS4j64TvhV2T/XPF6NMlwVt6pOjuvlciB2IbI8i/Wem4mQ6eCia4Xhe0hqSq1Vk
         w7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761050541; x=1761655341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icUi6yhGBFPCJDF6YW0uPghHiBtXnlV2bRo9arBdueU=;
        b=GD6Tg6klOFhbhXzUjkOLb7Bd74RAhkgXMVo/XFhye8g3/5AtoUC2Gn6EQuyzpC+CuU
         addofkG4r9i7Zgb6xS2KBEuZ7iUg1ZnH9DbrXA5qgPuLhG5bXd8zQgb2HMJyDNeS8MFp
         dNY0ZRwdTBstWT5P+0wKmSTF/ZJf0y0fvMK+Y/nM1+RHSeytJodJI944g0nLB7Q/F2tV
         sc7WRJ7Lf3Zxv5lh2bUaCwd7kjs/iwJEHQ4eywcSRmZIwFGeQg1LFrTBaSAQ53ho0Bfr
         EthIBdhffcjWt4VxYVFNhLZ3gkp4Ak3NEiEVGyT0RJ6o0UFKXAEx9oTuFWzdak7Mphu6
         zqdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBxXZ8xDebimo/HlhaZ/lQGRrRJyYsN1c6fzfqZuKCy1CL0/AgzevuJ7c3zycuZJmExp8h0RKRg7I1SQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6QghEzb0uKvGYkf9Syp2YsPNOVb10+0TCh8KTP4iCSR/vpniS
	ATfaTPIRroQwgNmAtkN1xQGgMulQBxl2XnScc/dgo6WI6H7xHbXQfpA4nQdSU/KA98KqHEgdDVK
	Yg7cPMmJE7GP/+fUGVUabbgmLtZfRtIlGXczWTgq3kA==
X-Gm-Gg: ASbGnct+19WLs04XBKKUojAi/bJUq6+043kJxDWrAYDEhF0a0U4F3Tvu5bWpmG2zM9P
	1aRHo1YeTZFnMZRpxxvBLO1iXX71W23uso/RhqOjVkAmsDOOwTyQgBqDk1xJ9derx2t4+hY4ZNa
	gdXtK2YSSC3McAI6kNqwlvvBwiCTYtOj2TFpJiIkaWPc7AdGa99oVzDxcy0sxlaff15EYgjPXOw
	Lg09DVORNUt0bPy8AMEgnyQT+zBh1v34FvZB66g7T2KjSjUpKVYyuXwUbKzog+7Zfovw4+zxc4A
	1rdPExQS7YOPYVkz
X-Google-Smtp-Source: AGHT+IFGDPpBTeZONomFBAX1YzaiEBTSDtfpfJUCvTHtBOgU4ya2tYe3GNuR1bPQdzr+C4NaB2OPAwZEOmn27L5nTu8=
X-Received: by 2002:a05:6512:b1e:b0:58a:92cc:5819 with SMTP id
 2adb3069b0e04-591d853543dmr5476524e87.36.1761050541329; Tue, 21 Oct 2025
 05:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1v9Tqf-0000000ApJd-3dxC@rmk-PC.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:42:09 +0200
X-Gm-Features: AS18NWCRXicscJ1flw2qh-h28tM6CuC6Xw1MuRCeg5_mvREPDMfXTaEvmtfWRbw
Message-ID: <CAMRc=MccHEaXs6KJfG_ph=wG5TS4UTpG4Rzj25C4qbC_fCS21A@mail.gmail.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: replace has_xxxx with core_type
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 9:41=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> After the five patch cleanup has been merged, I will want to submit
> this for merging.
>
> The problem:
> - Any new stmmac glue code is likely to conflict with this.
> - Bartosz Golaszewski's qcom-ethqos patches posted on 8th October
>   will conflict with this if resubmitted (we're changing lines that
>   overlap in diff context.)
> - Maxime Chevallier's tiemstamping changes will conflict with this.
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
