Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9C79C8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Mar 2024 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709379750; cv=none; b=M1F567Wpp5L8Jh3cvzMlCd3TVWEZFDBwUOQgidPHtuEKXUA/XlUIFRfm5XCvrmpRqWfQldR308PdL4ZRmiR66rjeeltAsnGPugsMvwV3fhofKEtwBsRjSqsKalhyTd4vMdOCknAR48xSpKZPG/3DcJYy6kypihv6TkivtqNdHbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709379750; c=relaxed/simple;
	bh=8T1xxnqxA4Cn7ZALmW7k2vXmJDpc3Ja/SWJ6xwaLSSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ayPfHgq/GoeDz/tTE3hZorFxKDnNYcJIY/DhMuXIiVcd9pnLbFiuKTa1hgHiOVBKR7HMJ0PX4sb7W4325kPQ2PVrFJBZGrzVZlJGa2THY5ovEYqraQUAHv0H2EHYQWL29p0fR872SbRwIHx7fGGSxBhspsZ8EFdQHH6dcTA/wfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7bc332d3a8cso187938139f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Mar 2024 03:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709379744; x=1709984544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8T1xxnqxA4Cn7ZALmW7k2vXmJDpc3Ja/SWJ6xwaLSSU=;
        b=UNTgQ5tNAPU9ksYE8+MSonAGxJlBmcYTu6nq3Bk2UC0Jy5HWhdeeltud522W7wonvR
         7pRq4c+PHzltAn7wbvzTOyUtHo47GZeBHUC6C2rjIXfCHzRNLdujDjKjN28OqoAMp2ld
         OgOdvzSidNf5m+AafazfibYccfLX3VNoPRTwdrC4QAwryhz35+dP+UCGRq+jlFGLrdw8
         iw40kdAAyH1Yf8WAUcHuUCIjntp7wzMeBPgMJze7rOpNytWIOB6yXuJhEN8B7e0c5W0f
         oh9Halknqcbxltdcz0imwgDUfWTZJhN77GqjAI6WQaUhFGqFS/KCOzFCI1HZCz0hFdTs
         Pc5A==
X-Forwarded-Encrypted: i=1; AJvYcCWe5vUjnpV/+KbhcIxIpdbyL2qvnAFkNNWY5io/k8twMwVHDTgC+SD2G8FA/j1YRODbxpflSgH1W47mLuXlu6ZRb+u/FPt55WSgEao=
X-Gm-Message-State: AOJu0YyjRQMfzR5PGaw6BaaPHYVRMnzF4grX2t0wvBuymbsRS5EWxEc+
	ml4xRJ4PLS/l/XjSVqOk7yHjS/NnnIDadchLEDCeKjJaYiEtEJgsG1ho2OHXtkc=
X-Google-Smtp-Source: AGHT+IETV6jcobR9qgTkK4voTmrQF8azeLJoQYf8vgo4iokBbBmp55joQ8q0L42O/xzXL+3D+hTDMA==
X-Received: by 2002:a05:6e02:1c82:b0:365:b614:5cb7 with SMTP id w2-20020a056e021c8200b00365b6145cb7mr5348772ill.16.1709379744592;
        Sat, 02 Mar 2024 03:42:24 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id r16-20020a62e410000000b006e46047fe04sm4360348pfh.204.2024.03.02.03.42.24
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 03:42:24 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e5c0be115aso994978b3a.3
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Mar 2024 03:42:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6L5wIS9yURYw8tdJWrBEENYmaGZ5JaWeloRoJh9bg6TG/bRbWXVTeet517UBRoJKgOk6gGA10285TEqICt7g4P0nt0KY53wSokok=
X-Received: by 2002:a05:6a20:8e01:b0:1a1:e75:477c with SMTP id
 y1-20020a056a208e0100b001a10e75477cmr5238403pzj.9.1709379743994; Sat, 02 Mar
 2024 03:42:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231013181712.2128037-1-jernej.skrabec@gmail.com>
In-Reply-To: <20231013181712.2128037-1-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 2 Mar 2024 19:42:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v651T28yrkaAbX3ckV8gEsYXdGgHMgCb3Jdmbej2OnNyLQ@mail.gmail.com>
Message-ID: <CAGb2v651T28yrkaAbX3ckV8gEsYXdGgHMgCb3Jdmbej2OnNyLQ@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h6: Reparent CPUX during PLL CPUX rate change
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, sboyd@kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Chad Wagner <wagnerch42@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2023 at 2:17=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> While PLL CPUX clock rate change when CPU is running from it works in
> vast majority of cases, now and then it causes instability. This leads
> to system crashes and other undefined behaviour. After a lot of testing
> (30+ hours) while also doing a lot of frequency switches, we can't
> observe any instability issues anymore when doing reparenting to stable
> clock like 24 MHz oscillator.
>
> Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU=
")
> Reported-by: Chad Wagner <wagnerch42@gmail.com>
> Link: https://forum.libreelec.tv/thread/27295-orange-pi-3-lts-freezes/
> Tested-by: Chad Wagner <wagnerch42@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
