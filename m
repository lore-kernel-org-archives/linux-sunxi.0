Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CFD39659A
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272233; cv=none; b=X3XddfJgmKFk0/la4iyimdp1RQ90grcYSgsHsNsFBi5VXXppcsTt3HydMkJH/NW47PYJchA948+/8FToUkuNztCeUy+DuqfN9W8Nt1g3Dojaks/sAZ+gmdaDo1DuxPJXxCwEp/GWBc0aV7fe3yAjZX4cuuaFrlXLaoDIMBHPNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272233; c=relaxed/simple;
	bh=p4euLU3dzlJaKSg+W6fHDQOReg72+Z4efBvrwOXxb+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvMBmd0En4U4brFQmfRfqlqZK6PTcMATTkNlmPqP6osL5eXpuW4vjWbQxsGtdOpGUVIykqVhO0woIPP01GUsMSqAtJ8W2ZW9uIS9Yd8gj9pJdh4T7zykvo7CCAU0X85r1PCsvSzcfeCcl7EMd+mgmZSzZIZhgwXgse3E4jI0PpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5HtEG+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5HtEG+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070A0C2BCB4
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272233;
	bh=p4euLU3dzlJaKSg+W6fHDQOReg72+Z4efBvrwOXxb+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e5HtEG+7Z0hUDOWD3lrZNo7a5ayfeIp4SuizcRE4uO+9EmsW6BKXHcDeifvaxe2rG
	 /ceh2tyMi5IQbD7GLa5h7LrgBy3Y8VacInQubtMZaeCLkxtliLIBn4nQGNwUOe/wBW
	 QbjfMaLR5sJXIU8YSZUO3SCti6TsRFNn4FiLOVdWtKVlTErmN0xUNv/9tkq88PPhTf
	 qssJrNQOt2HkVZyO8EvMkPR1qSjAZeNS8e6159kq2ha/5Iyvs43bh3AeN6D2/fXZU4
	 JHf64I8vwPYntE4oEO7/Bi25jM18wKuNtomZjGX6ciHWT02qSMeWrXH8R2oY8QYTFb
	 TJZQJ7uCmsVEQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79ab0e9c724so1796697b3.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 06:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLnlxstOaO107CA7wuPVFKQwOEI39tFGOspKjheQcDv8k2n2mXJT7UkY9i/Z1/y8jjC9uVLri+knN9OQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXYslWp52gOyxIEBEMvSGJXO8Hxzy5nQuylUZDq/i7t5mxKiRu
	b8iJnim2AgBIq0c56Zq/LvNd9EnzddgV3oJQAASx/1KD0VToajOyruDm/gPTXP6ua2lxMhytJye
	kj7hvd3EMThq/eO8+qP6yCIqtaqq3FWE=
X-Received: by 2002:a05:690c:2605:b0:798:1219:c78d with SMTP id
 00721157ae682-79a90c0a53emr125159107b3.50.1774272232374; Mon, 23 Mar 2026
 06:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
In-Reply-To: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:23:41 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ztBrtMxaN3JohArsPm5sYaJ8=54v8VrCHyFRPOBsROQ@mail.gmail.com>
X-Gm-Features: AQROBzCnimvZvEKxbgJqnARSDh8ZkIJDbBTIcd5gmgSkLxqAgXbW8hAX9GtTaeY
Message-ID: <CAD++jL=ztBrtMxaN3JohArsPm5sYaJ8=54v8VrCHyFRPOBsROQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] fix gpiochip_lock_as_irq() failure when pinmux is unknown
To: michal.piekos@mmpsystems.pl
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

this v6 patchset applied for fixes!

Yours,
Linus Walleij
