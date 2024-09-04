Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319B39FFE
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461237; cv=none; b=RO7FQpr9HoSJh6klkedTS4MVsfhEMCXuX6k0ziR93smS+qAWrIILsYWhF8swUwYQMbowWzwQeUPPAtfrZaHDUDFC6QZ5WdgOF/4AjWPgmWN3zOsQjO1zETXx6Sg0eSi4K3TTZs+alraNyc4OJ8LntUKbn64rSjUQXm/Ya4yYDs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461237; c=relaxed/simple;
	bh=AKet6FBn6erAGoQQYdu36m7bdCrh3rvMBwarDpAMcrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9UVU+GugZs1livH7wRww3Ly6bRKxTpLbAWTgMcYHS8ol7XRYi+MoizRYkq7LfJvro5rwwIrTvU4LvgLe4qaRuwNl/3bOEOQZzwUljMoTTKU7DosQ5wnzqbx7EMmFcvklw4xARAN2R5+xqyxG73bKvfYp7T+Og8nsRFmXMEEowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f01b8738dso5006314e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 07:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461232; x=1726066032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKet6FBn6erAGoQQYdu36m7bdCrh3rvMBwarDpAMcrk=;
        b=NkpxvknOorNHES/A2ROSMvCUBAnh6QYl5dE7xetsPPE3fzDGiexUOmCEh6T3VZUyjN
         U6501INf4FW/UaM4hMMr5dISc8xDETheHo7PufWDznToT809ZKBFgX6Bcccly7HUbAy0
         RwfAU0mdFWeGNGV4y1UCkXHEeF9O2gfMk1HVOVzIccSSdAgEAQWmr4nlz7BWps0xjDBu
         j8yAQoO+0mHvTHPOxsnzijRa+G9AiaYGM6VJAtguggVTq+I30efBcBa+CIcY8sWfgd+6
         T9Uu7DxD+Ax23uMXRYLuUIXhi5agh7lhH43J8XWIC/f1NOit2D6il5276n4g6YcdNvln
         6yZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZkLGKTrj4ZEosZIJbRJrlJ13Ox+p0WTIIUkmzhWE/p0YnKCYP4ZOO+ikuZAm8nQ05HNK+aY6nMkjR1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrR5vjNh5epEivEBXRXD+v7Z8B25+60R+jTT/wRwY+h4v0ZHmA
	7qWoxlYs9g+4mMx9SrtS3NknzKKn3tPO7qQI/3iBG3vm61GLEf3gWanqJfdQ
X-Google-Smtp-Source: AGHT+IHESEb0rBXUjBvu85K8OXoxdMk4h5xGvUelCpXOovnwa8XkRu0E/Fetnu6I7w9+g7SHZCBRow==
X-Received: by 2002:a05:6512:3ba1:b0:52c:e312:2082 with SMTP id 2adb3069b0e04-53546bb5604mr11746023e87.54.1725461230777;
        Wed, 04 Sep 2024 07:47:10 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53569471e85sm146402e87.139.2024.09.04.07.47.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:47:10 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f25a1713so80196921fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 07:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVh+aumJWWwbV+uBIGBr3mMSXOaMb6RU4ix/oYyosL42HiB1GIbWJw91uEghv37t7zmOPgX5qJ+I2VJng==@lists.linux.dev
X-Received: by 2002:a05:651c:4cb:b0:2f6:2858:a0b4 with SMTP id
 38308e7fff4ca-2f62858a308mr101592101fa.19.1725461230260; Wed, 04 Sep 2024
 07:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240730194905.2587202-1-mwalle@kernel.org>
In-Reply-To: <20240730194905.2587202-1-mwalle@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 4 Sep 2024 22:46:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64SCQbfW=kKU5306fk8MrhBtsjpXX1YaWsXHV5fso-dcA@mail.gmail.com>
Message-ID: <CAGb2v64SCQbfW=kKU5306fk8MrhBtsjpXX1YaWsXHV5fso-dcA@mail.gmail.com>
Subject: Re: [PATCH] rtc: sun6i: disable automatic clock input switching
To: Michael Walle <mwalle@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 3:49=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> The V3(s) will detect a valid external low frequency clock and if it is
> not present will automatically switch to the internal one. This might
> hide bugs and (hardware) configuration errors. It's even worse because
> the internal RTC runs significantly slower (32.000Hz vs 32.768Hz).
> Fortunately for us, the V3(s) has an (undocumented) bypass of this
> switching and the driver already supports it by setting the
> .has_auto_swt flag.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
