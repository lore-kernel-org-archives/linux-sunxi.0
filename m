Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691AC16D307
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724084754; cv=none; b=ewXPdTS4/hVeZEhLEJ0iNHuB9i9SmoCqgPnjrunDv5IeLX6fIlx9orv2xvtr1VyWizJkVdKTLhU18bf6DOLr1NFuzsGxLq/LGDtbBmc/kdspxT/YI4Pty4klP/6lJnEMH5gShktC0awn6T9xowp9JEgAlnoTKRD6d+kqHkXRdJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724084754; c=relaxed/simple;
	bh=7NqWr36HuVT4OotxGSUjFuV5V7CFfE5R2Y8n4XuSnJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gp8k3sI4tdAe4GkMVxNmuOKFyhudG0jLtvoJgm116Wcficc8tPWmFnkrOqO97sGboRvyy5STO4pfuzQFCC1waCYTgR246AD8qN5mMLO2zlZXVkMf/8HquzshUZzpztBJfKO39A+JSCxxcZ/cS4mkxvnV6jk13yqoZZnW0PWtTGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5320d8155b4so5993210e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084749; x=1724689549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tHGsPt2XMV+DbbdXwYM1UeT8GX8eWUBRSysGoQM7AE=;
        b=TR/dmUJ019z6e0w25JLGV9Mr+hiQwj1AADltPMqRWOAs6OGDy9eKqkYb6lnK40382+
         kjlOxAonGcNhhYKtTWI9o0D3M4e7QqBscJyPjfcU2oHgVQjzhhIfQWS0x+OQsCBP6MWa
         YDuKDxlpx5tjlzpCTYZk7p9m4bJqiGfzEpv00zymHrUleJsFii8qVwRTIbR8cIAIj+qQ
         f1+VaQ8iHG417OaVzUxaXEf5CHoTWazNVwBv7c2gmBFDT466vz3xHeCBKDmPws8tR/BB
         +W1S486xSfE1OILh0Nma+AYuxwdyRASvwFev3GfU+EAtKxfzPShFLombqvk6iBxazUwk
         I07w==
X-Forwarded-Encrypted: i=1; AJvYcCWFTQmzixhQ6AJ2LHn47dQ9LHZg8BdIXVqejhr5/lPd61OWp1+NjWWHmehOkmOysKVZ/prhRTIMsc5oqOn/AVibgdQDWJLx/Zki3kI=
X-Gm-Message-State: AOJu0YzCek+7wV9+DiMxFWxa73gaCvqgWJbrPpTLLXKbdvzF9srRLbLZ
	1BsUL+sGVzqJT100EzNuBBm8hdeFZgqk/yocEElyyS/Fd97XJsMynCX6ZjMH
X-Google-Smtp-Source: AGHT+IHR2qWCviInkw/7t5Sdz6Cy96TTJocqGUHRyFHc8NiJPa8b1bt9P8N94pV1l4kJVRDVcUM9OQ==
X-Received: by 2002:a05:6512:31d6:b0:52c:e047:5c38 with SMTP id 2adb3069b0e04-5331c69dcd9mr7368094e87.15.1724084748714;
        Mon, 19 Aug 2024 09:25:48 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3b8bb2sm1517131e87.84.2024.08.19.09.25.47
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:25:47 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3b8eb3df5so45872071fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:25:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWA9DJKWapDXzTBbeCOdBZA5jnMA/v4AQjgvfY2fX6j99la77KMfcbkXmKRK/ZbNhRWjKjkNhYJt+CBamp2Ho6WuRY8CZIP4A8qeLY=
X-Received: by 2002:a05:651c:504:b0:2f1:56a6:6057 with SMTP id
 38308e7fff4ca-2f3be57849emr72731681fa.7.1724084747357; Mon, 19 Aug 2024
 09:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240816171129.6411-1-abhishektamboli9@gmail.com>
In-Reply-To: <20240816171129.6411-1-abhishektamboli9@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 20 Aug 2024 00:25:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v66J7ceyPikD8atnybMD-UsVwAJZ4TRo16LroyVkAOc1Yw@mail.gmail.com>
Message-ID: <CAGb2v66J7ceyPikD8atnybMD-UsVwAJZ4TRo16LroyVkAOc1Yw@mail.gmail.com>
Subject: Re: [PATCH] leds: sun50i-a100: Replace msleep() with usleep_range()
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	skhan@linuxfoundation.org, rbmarliere@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 1:12=E2=80=AFAM Abhishek Tamboli
<abhishektamboli9@gmail.com> wrote:
>
> Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
> to address the checkpatch.pl warning. msleep() for such short delay
> can lead to inaccurate sleep times. Switch to usleep_range()
> provide more precise delay.
>
> Fix the following warning from checkpatch.pl:
>
> WARNING: msleep < 20ms can sleep for up to 20ms;
> see Documentation/timers/timers-howto.rst
> +               msleep(1);
>
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
