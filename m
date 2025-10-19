Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65021222565
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760859781; cv=none; b=t161FpvdZ3ldxE4Wy+RxwSBsAgpbPAHs1sdRCgAaAJQzj6/dnPLTPpjWVvl4NZcsI3mTuff76bgH5f7X+dRIB11QuxMThZmJHOf0CS8tYSvA7SzDcv0BDCOfBTda+Ge1kP8TdFfWw+mJjhacQkgigIXDddTgle0i/tFBAK6Id2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760859781; c=relaxed/simple;
	bh=a6iMxdmrYbuGMj6PYzMkKXgm2YkNHUTOljsMub0V7/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbC15bJeTxIKHVWzPnEQ4M7ueA/0jfWrn8kGWYFKt1wtqgtsuauLVGGwaA/InosszX28LFILp18+BdfnheENmXilISEhyz0JNwizvH6Bnw7JoEahZzV6kjwGbg/lMk/UCr2NwJmlcdelLoNvsxW5kfWiekBqeQdimvBpbCF7xmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57b35e176dbso4342947e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 00:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760859776; x=1761464576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6iMxdmrYbuGMj6PYzMkKXgm2YkNHUTOljsMub0V7/Q=;
        b=HegMLhLKV/0OL3H2mwYMiupAsV9PGnk4P/W45sSyA1FH9NSXmmiXuPOvPhm/y7Xpex
         Eemvb2NeiajJL+cV4F8GsMt73DEL9WlCwlxbe4lxBEIAvC6pRvOyqUjV9C4K1q0DH/uB
         3FUfOjRSJTJGIi9J22hmoHhrjRzQp7UFKdiSHGM0KLeGbFFfFaO8Nx7+bGuJ8U+HKJ/e
         LDhOjVP17Y4s9QHzWVZ0tH8rvmxxs/doekGtvDXXJxaE5EQx6CzGRwRSRFQmYqTjYt2M
         +NM9OEAK43UfW9WzK3AU/LfA9xpYKT3BMxuCTGsAUjx6DWdxhvSAzgrv91NBrf2Ta+zj
         F7/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSlwdw82qCn+BOoivTPfZWS2z3y456wWVWbTyA31ZdqDqHKLa9VCqHEmxvmwQUPcqN5DuJmM/9RpQOMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhwim4vC+u6nzU4JFV3vYPfwWcaRUK/XiWtBSICkpfBosefvlv
	XDNKZLbbw6BKoQ0qjG7ZY/ynDmKirYynSytKZTi2ErTAqokdxrmIfnJpEM4eAjJm
X-Gm-Gg: ASbGncu6si4t0tTlKf7dvQaYtUv9NvXoP2Y6qXpRmJP89wy85PhU1ihbaU9yYYy1vuS
	qooejzQprPFE09O0C1v9g6a3Rmuxlf7oSh1Z86AJUx0Wd/Oqb1CPcfyxHkVHvJ1uUyoAyEmYO8v
	FXT5ktHx6gr/TVugI9YcFoDHzKbxeV//P/OhgQYE0EmDkc8uTPdj/j6BEHarvm8OAWh3epWWusc
	UZE4KqEBeuqKvM1rbDRqzQsrFNfEoYGOHBd4mZZ6ofXF8pf8XyQk+28lMLd2AxkFg12n7YskJsj
	l0iHnf0RDOeLGlPUOofor0v4sqo/DVofxHJZUmWKDLPjLoKWswSuXMaK9UygEBmMJpzf24qBySs
	wn7N4JDSo1XPyBO7tLcYkCUoXUV7pz2Va7fcCTtNJLA6/S/Ig6zcXT/WTUJ1enkplux0gyhhFAE
	ZscOJZBN02OYevUnlaqN7Gsiz9RoOSKRXWXRtYRv6bCA4=
X-Google-Smtp-Source: AGHT+IGnMNEWbgjvGAL4nED07l9tW6/7/T5j66cHAb5e0fDNDlqdhM/oT35WoZv45AKbR/LkgECjEA==
X-Received: by 2002:a05:6512:6d0:b0:585:1ca7:1b7b with SMTP id 2adb3069b0e04-591d853530amr3201954e87.31.1760859775511;
        Sun, 19 Oct 2025 00:42:55 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deea8896sm1352778e87.14.2025.10.19.00.42.54
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 00:42:54 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-373a1ab2081so35126391fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 00:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+9P+eP0dAhyMMCldcmN2x7CzYD6JhJy3rhkN9bDIEVSHi9nruclfkaFUJHMtt5RL7h0hLV3dhI/UNjQ==@lists.linux.dev
X-Received: by 2002:a05:651c:1510:b0:336:ae5b:8a12 with SMTP id
 38308e7fff4ca-37797830eb3mr28747941fa.3.1760859774128; Sun, 19 Oct 2025
 00:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-3-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-3-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v644YqdwspTda7cy6y6iYQHRrt3e5hD_m_pEfC-x-py1mQ@mail.gmail.com>
X-Gm-Features: AS18NWCc9PhOVShnjr54QcL_MXzi6J-9o-zc3G5gD4DZJXqV9MLEpSrxeXlLZX4
Message-ID: <CAGb2v644YqdwspTda7cy6y6iYQHRrt3e5hD_m_pEfC-x-py1mQ@mail.gmail.com>
Subject: Re: [PATCH 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Those engine versions don't need ccsc argument, since CSC units are
> located on different position and for each layer.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
