Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1635A78C91
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 04:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748925711; cv=none; b=RPIMCeParnhk9LOR2HRNAb0+VQ2lsKL/le2zKRmefogsH3WIQkyLwDvEzM6RqhhymYnaH1/AA3vPuda9rEkjYDySQT/7MREtWlMOJZXFzAHN+i5bI9D/xg0Z40LtV1NyHxdnlG6p+Jay38bhUxy6hv7BRTlzZTXJ3Wmy4H0GDh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748925711; c=relaxed/simple;
	bh=BED0WVH0ui801+fOhuTnComAdNPJBDfJ7ZYmPTvoYyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kf8es7s8kg93c7hIRsQcdkpW4/akOCXQw87ZSO44FuH7mAVkqybxJvMZfaqLPCrpsaPbczV4Nu/PqJxX0NYqYVZ1C4uT64tLaLhljo8n44R/VbXK7HchAwndqZ9BlYeI9szCNjvapNl6DIVjV6VnlekiOj6tR177nYhaAkz17a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55342bca34eso2955263e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 21:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748925705; x=1749530505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BED0WVH0ui801+fOhuTnComAdNPJBDfJ7ZYmPTvoYyA=;
        b=BNkXCwWko4dIMmJfwvPJV0TFROM0JIIFqYbwKbtiaNwhw7fi7fUWKwqgRmciVcCSb+
         dB8EHuVoaGWMUKyOqqmNFhG2cwftKX9sIFRi58el8h4LFb0xYuxjkozRHqfNY72M/Rzw
         zCIb56ZsraRY+UXjlyj799RXWnOe37k+q7+R7FSO0Ei3g8ka8fiUdnx0VbV2eejJ/sbC
         C+Wfp1A0XUiw55OYWi5pZvg+Mr9Nt35cRA1duoMwL7Nel0cFdBmzssN5mltTd+og1CPx
         x4tREIzN1a7SK80Y3uvqeEOPPURJrsxNN/vNDVgqTjfT3eYRdtqYqkEfd1HaS9ocFK4w
         JwJA==
X-Forwarded-Encrypted: i=1; AJvYcCXIKipN40EoKtnLaQfLtwJ29QKv28nJgkNzI52nt3RpO6eod9/VXXW9Yp1ADE4TCwZuhCWL3ZLviWdsuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyainSY748MKuBQbPWQHLF8JEhByGuEVtzD8ocY4ZB+MCoDTZuK
	LqM8detnOC1D0x6zqHDFMP23mP2Rpaqoyu2IDJs0P+TkZ3HmCzKanuQLJxKm9+SNfYg=
X-Gm-Gg: ASbGncuwf7KzXGE5yegYihNOllyUUxxV4NZUa3w5hQAwbLlTcfDsIQwpOuSpD2m3C8W
	U8ue8J1yVz/r1PTfrogYCf30ykz2/+vNG+LB6gbZ2vStGKCjDtN1e2Gf94LWyjDAbPwkjNPGHB5
	fjl2/A0mwgSxOdHcdGgJNKWooJyT/pgxlOh8YbcPTNte9274Ga4bj5lnHoO0Z2XoPOr5jZdyeXF
	nc7vRlL6D7Tqtaw6KRHOvenGReCT/hYA7NZmBeAyMFM23/kJzJCGlA53ZQQpLziyf9vJ2zjSfU/
	aXhrsL0MEH/AJqeoizs60WjDY+sExNoZUrnRQxzsRfW+wnog391EuDuSre/SCzYUl9vl9TLu7FM
	+8yONz5ltm3nCmZzYx98=
X-Google-Smtp-Source: AGHT+IGWi95HtQ0y4wMgwX/JhYnTF7yfwa3t2XlJ5MW38OkCWnjdZLE/hxR9RZ4Wi1qg6/VgQPT/JA==
X-Received: by 2002:a05:6512:2203:b0:54b:1055:f4c3 with SMTP id 2adb3069b0e04-55342f544d3mr2562003e87.11.1748925705286;
        Mon, 02 Jun 2025 21:41:45 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a001bsm1780364e87.62.2025.06.02.21.41.43
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 21:41:44 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30f30200b51so50693281fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Jun 2025 21:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVycmz3lBJMXdG1epRmiOg5IuPaHfSFyFNdsNhEb/4QHBhMf9/5NPaDAnxbXHz6YlieZOFWvpeOr6IJWQ==@lists.linux.dev
X-Received: by 2002:a2e:bea5:0:b0:32a:8c7a:8350 with SMTP id
 38308e7fff4ca-32a9ea675f3mr36137841fa.30.1748925703708; Mon, 02 Jun 2025
 21:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org> <20250602151853.1942521-4-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Jun 2025 12:41:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
X-Gm-Features: AX0GCFsButCX6XOPdUHg9gMIjlAItX_YWWR5mtXZWLyYajpbu0GEJNOaxHVxyxs
Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>, 
	Will McVicker <willmcvicker@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravan Kanna <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 11:19=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
>
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
>
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
