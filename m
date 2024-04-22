Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C823FB9A
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713767286; cv=none; b=L+pOQ+WM0ENgSOLZ4p9881hpd01pMEQDs5Gxnpq6/GZsBOeMq+cpAIaQvpULUIGCtNi8yEmG4pI+jQV3Lv7PZBgq2ifggMDs3ioOrwKjt1BX6h6wwxRArc5+vHwthSLwstB0Hk1dFXCjsv9B9mNbpfm40VJsiDd9zG9KxEPIeSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713767286; c=relaxed/simple;
	bh=3nJxs6KDCzEvXDgS/hhsIWpVpzHE7gksU4iMi6yQ1hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4dmNAmKlgGzuQZI79cM6ihlASdbOpVg16IJvQpNX3+colh8IU46OCkNU6pci+AbLvpOTv5GJ9saxNqJV5+NP0VKz1J2+iyRobJQpXH18a3TMcSZrObiAGRnGOwI+9fHidYKPtulmaa84i54/xDY1Ks9wZgm7BZDp/BcLGieWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51b09c3a111so1224558e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 23:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713767282; x=1714372082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3nJxs6KDCzEvXDgS/hhsIWpVpzHE7gksU4iMi6yQ1hk=;
        b=tKH6jjqJXImCN8l+FiSMBAtwgCUjCtTB9dv9XRhhufBL6e5E+b6gJJFlsd+mEMCj9B
         lkAJp9WF/O9ke7q9e9H8it9Zlu4+CU3vXjAlemNvksWuLeP9+94NCztOCq2/THT6SglC
         qP8wPKdg0ggWDtzwWXIMbqblRDIwRwcNzoibUvRIQi688EDOXSti2qFlY6PZl7CDfvDK
         6uoUMSwkWW1BemEW2I0ULxvDyRoCq9pkp/Ci/2k27+/Xr9TfJH4bgbJ1DAqhsi5BboHL
         79IaL8kKl9CdMrhkQyFU9OsCs58R5qUMk1CNYAYdARUs+CRayG/G5EmX9sVlm6Ws7zPT
         36cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi+Y5OV/LfJnqWYwwsBTYwxSoPaK3WZleKHozyj87J3aliwcUUSvc/9SAGznJp/RpVeryGx0hSSy8nNfGj0CsgPK8YBRBO2ocjlrQ=
X-Gm-Message-State: AOJu0YyeucIddQc5pHkRp3QimNbzETtMrJCtH4+iUCmXh/HX4qJ/o5nb
	bOGX1fTsVTKiuCGa1jKfINU3p1zDveEUICuQcjfNfqfrb6+qeD5yTm0jFhaTmCY=
X-Google-Smtp-Source: AGHT+IEb5GDV+/edd7GfAH8h31kujgdKfNA1DoGzRIr0i6qH9k/b8j+olUfEyHimCUV4s3Sz6y5qvA==
X-Received: by 2002:a2e:9cc9:0:b0:2d8:930c:bbfa with SMTP id g9-20020a2e9cc9000000b002d8930cbbfamr5282883ljj.5.1713767282099;
        Sun, 21 Apr 2024 23:28:02 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id x6-20020a2e7c06000000b002da179d8d25sm1322152ljc.64.2024.04.21.23.28.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:28:01 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso60507371fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 23:28:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWtSeVjV81lqV3Ft5NWTxoa6W6HJcfIaDHL+MTNz3QW6wRAfd436jfjwjGs5gGxERkJfsxuOUOOzSUQZQBwrKRGo37WpwJ5cljSf4=
X-Received: by 2002:a05:651c:608:b0:2dd:97e:3481 with SMTP id
 k8-20020a05651c060800b002dd097e3481mr3120608lje.51.1713767281436; Sun, 21 Apr
 2024 23:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <285de20a187f3e4baeb28f639b5bf55e914a3821.1713756666.git.viresh.kumar@linaro.org>
In-Reply-To: <285de20a187f3e4baeb28f639b5bf55e914a3821.1713756666.git.viresh.kumar@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 21 Apr 2024 23:27:50 -0700
X-Gmail-Original-Message-ID: <CAGb2v66X94Y0zkHxNLb1KCoCR+q+z-mCm_21eUJ_C7D_srhDkw@mail.gmail.com>
Message-ID: <CAGb2v66X94Y0zkHxNLb1KCoCR+q+z-mCm_21eUJ_C7D_srhDkw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: sun50i: Fix build warning around snprint()
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, kernel test robot <lkp@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2024 at 8:31=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> The Sun50i driver generates a warning with W=3D1:
>
> warning: '%d' directive output may be truncated writing between 1 and 10 =
bytes into a region of size 2 [-Wformat-truncation=3D]
>
> Fix it by allocating a big enough array to print an integer.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404191715.LDwMm2gP-lkp@i=
ntel.com/
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
