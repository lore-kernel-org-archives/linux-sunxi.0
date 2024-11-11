Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CB54738
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 05:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731303081; cv=none; b=LzGP2SI8hFPEIJEysUdvzhUiKZcshOWArBa9C4VhszpDSvz9cWCgNFyC5AkyOPqyUungB9qWX0v07Z9S69iORXewwi48FYNTP5Zn4IS20GU9fqGPNlUkycueA4asiOM9d3umocuFlfFwsfz6mzSlESUUJTxpFK3/nnCfL5IYl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731303081; c=relaxed/simple;
	bh=zyKW1CXLEkdNEPmzSCYDESj1AeODVNzwQcQ+WLCbHjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbmHg7bFNGsUSGtu2i+7zWpbOuzKRDgWx2kMkQo4OPHUjnfmdVJpvOzkHvRNMaH9KO1EDFpdEbkTA0+XkBrkqx4hwdVPPHrabr3SpvM74OeLwF7MIJZ8D3wAX5X/ZN7xsGk+mgeU8qL6A2G4Kj8XnbdK217CY4/74P/WVPD7cww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53c73f01284so4880842e87.0
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 21:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731303074; x=1731907874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qlYch/7P7MKfX51HOayXD115fD1eKIDV7PlOr922WnY=;
        b=wAmRVv3AWjzQom/hn6H+J4b9mywqgz03+E0GWGaE8OCkjrBb4+LwyCK8V7G0Kgf2gZ
         9k0cFRvgK/ve8sHEGuJTrQ4J/zG2g+yV69WAVphsYK/ZpyPt2YqbmmH7lQJVKhNdyC01
         P75TB7u2ZiHSm/dvdptR4g14WC6pvvrLrzNXohs4DrDArycbET0L9QdT3thAMFCZkFno
         dDkrJSLDNjiyr4X+MGDauo4TYD8QNBEl5yqbL9lX6MZj0NF8HiXQdFe5t/uM3EHP390G
         D5eXCq+27Nf95AS+nP4ui5tKP93nFEjHZbI7agpHdyFZpTghLEU2v+XnVfYU/+lPmGq+
         Bejw==
X-Forwarded-Encrypted: i=1; AJvYcCWA7SeBehS5kOfbMrDBcHZYszHHasbka+SAEHAVnlVDhoBK7tW+xZx6JnIvGXeaHPdDmMzP9vgPVqv3WQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsO6KaCiQrMAY499rzKWxh94pUlJQOVxi6u8za4lldjuRbgJnj
	44OUiNeCRB/JeouHcvQ5g+O8B7+amayAXjwFkLLHGdKb4kSrwsegXVcQIT2p
X-Google-Smtp-Source: AGHT+IHJ9zGeatbPlHi6a3inIjN0raAY1P55iAuGyeW9+r5l2xjwhY0Xs3Bh4IK6T82vvD1f4SqGfQ==
X-Received: by 2002:a05:6512:1255:b0:539:f5a9:b224 with SMTP id 2adb3069b0e04-53d8627cfdfmr3830119e87.11.1731303074084;
        Sun, 10 Nov 2024 21:31:14 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a72f2sm1430657e87.145.2024.11.10.21.31.11
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 21:31:12 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso4515563e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 21:31:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeIaJnXEiyEXR5eW6IgDzseQzWpmbs9v5QMbcbM9cufTn3g9XA2Y65h1wHmEWcdxJK4W63iG4uuhRd7Q==@lists.linux.dev
X-Received: by 2002:a05:651c:544:b0:2fb:6027:7c0a with SMTP id
 38308e7fff4ca-2ff201e734amr40481541fa.8.1731303071547; Sun, 10 Nov 2024
 21:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-13-masterr3c0rd@epochal.quest> <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
In-Reply-To: <20241111041311.hleaz5fgipsyxigm@vireshk-i7>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 11 Nov 2024 13:30:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
Message-ID: <CAGb2v646NHFAni=P+iC8OZsWMpg0PJc=kYbuWaY=C0-W-q6qAw@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] cpufreq: sun50i: add a100 cpufreq support
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Parthiban <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 12:13=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 31-10-24, 04:02, Cody Eksal wrote:
> > From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> >
> > Let's add cpufreq nvmem based for allwinner a100 soc. It's similar to h=
6,
> > let us use efuse_xlate to extract the differentiated part.
> >
> > Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> > [masterr3c0rd@epochal.quest: add A100 to opp_match_list]
> > Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> > ---
> > Changes in V2:
> >  - Add the A100 to the cpufreq-dt-platdev blacklist.
>
> Can this be applied to the cpufreq tree separately ?

Yes.

Acked-by: Chen-Yu Tsai <wens@csie.org>
