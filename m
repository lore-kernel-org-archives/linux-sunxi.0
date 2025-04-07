Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC8221F11
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Apr 2025 04:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001502; cv=none; b=ciGncXy9esxgPV5UcM+2N4bPTeBaLJZvmMy/ytDln6vUnU8DLZxdsBXX0apq1dGKgJ+6/niIpe/V3whNOT6VlfZF4qBTZ1wj5vnx6W83wHmADAzXZR+4UcshWFeBrfPpbKBJYhre9wOLvWk2eZ0lqQQSa3Y5oetO2JRLeqKDoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001502; c=relaxed/simple;
	bh=bDu17t7QA6exZYoRurdfltwiK2f3AboG3S2VqLAUx8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLvfikcjaJ2YkcQNYk3Tes97PpUQathb+/uyTnmg2JwaQxpC3Gepfdq1exPhISudvlbBbcuSB68KPgCgCvffUsT5BViRpNH4fmh3q0wR94Cz/YAw3GyhInQ3hlyBr+2Mk8MavB2hGK7fUErSfG4SA1Dfou/RrfXqlcYhkdxA9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30c461a45f8so38939551fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Apr 2025 21:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001496; x=1744606296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDu17t7QA6exZYoRurdfltwiK2f3AboG3S2VqLAUx8o=;
        b=rDF/qFFf5SeEg+LNV8NbWEOdFktr6QBJnVLfnGi7waFPYVJuQzzAHQ92w/3MIFMpFV
         JKh1PzCWlmEqlNqFa61/ab4DAyvnfXGTOGscwoqWpBFW2jFTGZ2w64UFX/AM0JIBz6r2
         XI+ZnMSkENdZr9jqvl4/zn5mcXI7+3xe1rlW3qgApQhaV/5Kdd/KbGTSaYkAv5Zs1yOE
         EO9mbHENJpeP71dasbSCDUtogXmh7B3uXsM73lNDdpRZPmUVo0ls6J+2/MOsmufLr50Z
         8cXc7FsmnC4Z8icsd4lzhrDZ6/dvfosb4UT0FNOGQ6pOK2b/Z3Ailk5MlnjcOlQoesAq
         N9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcCVNYGbawaG69klPiIyyTKWtomOEowHOp3vxaTIplwKZ26KxYVgL4aWfeRHU05revzr5qrGk3kM2CVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwQPnN0C96D59NjIktTWKpOnczXHZYa8eGSsArgmuGKmJd2Ak6
	wW8DbIEIK+SeBwMrDLQhOdVUYTWIpPaY8W7fHutfd783/n6MnesvIDByJ5Ihuvc=
X-Gm-Gg: ASbGncszuMJjNYuVx8ElgF6tOExa3lfS2PTOpFm+zxLNAEDyBhpeSG4V31wKBcTii4F
	SvaB0PqRGQ+UL5xkMKbu2E5fEI0b7t3x2ynWbOXGPTUF+LBWv6K2YElxL6m959L51BTreIajetp
	t1GAT41PHsIKVlbYSeD3THCftm748mlvHj7mFIUgucSqna0gho1Z5+CLjssimgwSXvLIuSH5j3k
	k+egJtSNMMwa9JsbQBY2Dv+TYwXTGzmjC2NzbQO8pJlLgUxsy70DNizXrj4Mojd0vGzkSLTETJh
	CCn99CQ4EHvabFpIsB8MiP5TqUOEVXBZdV7tXFEn4TokSA5UAKjfQwPGZZFLTfrxrrsTnJepvQ=
	=
X-Google-Smtp-Source: AGHT+IGeHhSWXO38NGwhr6KH8jKfYGDVWtptaY9iz8GDz8WJj3uW4+gOi7QxkXqNfgaekTrskYbRgQ==
X-Received: by 2002:a05:651c:154e:b0:30b:badf:75f0 with SMTP id 38308e7fff4ca-30f0be061b3mr32130911fa.2.1744001495813;
        Sun, 06 Apr 2025 21:51:35 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03044749sm14737691fa.0.2025.04.06.21.51.34
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 21:51:35 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so4214721e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Apr 2025 21:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8H5fn+iiaOPQeluVmEfZqVs8ut0nK0E6V/icq53zovOoRwQGgTRaXFamt2CwrqTvz1nc39i2js4V6kg==@lists.linux.dev
X-Received: by 2002:a05:6512:23a9:b0:545:2a7f:8f79 with SMTP id
 2adb3069b0e04-54c232de7c0mr3438632e87.16.1744001494072; Sun, 06 Apr 2025
 21:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250325092640.996802-1-nichen@iscas.ac.cn>
In-Reply-To: <20250325092640.996802-1-nichen@iscas.ac.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Apr 2025 12:51:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v66jSyedrAAn+7X0TG4PGvK0M8m3WSF5Rt2483x02R0r2w@mail.gmail.com>
X-Gm-Features: ATxdqUEZG7Odd0SifC_ricgYeL5KuO6wOUwtgabtbNsFOdLz6S_zfFbrTXMlBZE
Message-ID: <CAGb2v66jSyedrAAn+7X0TG4PGvK0M8m3WSF5Rt2483x02R0r2w@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: sun8i-codec: Remove unnecessary NULL check
 before clk_prepare_enable/clk_disable_unprepare
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	jernej.skrabec@gmail.com, samuel@sholland.org, ckeepax@opensource.cirrus.com, 
	u.kleine-koenig@baylibre.com, megi@xff.cz, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 5:28=E2=80=AFPM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> clk_prepare_enable() and clk_disable_unprepare() already checked
> NULL clock parameter.Remove unneeded NULL check for clk here.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
