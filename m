Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5943019A3
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582291; cv=none; b=BaQGRJCblmYi1aDUdQaaczit85VF+GshkCuoUYZ2HT7yQU24nAdNywBatqNxXv0+ZzixmVgOwK2WPhb20xdCKmLlhFtGNFBsHHfqnEIduGa0DBbrmRbzZ5bXg/HziSgEe8H5TqpRzC88vHOHMXHb8H50Iv+p212z45PMVzGnhVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582291; c=relaxed/simple;
	bh=iFUNgXsnYA88I+eiduiUIs6MsVz6z/JWH9W3jdxReHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8OVFQTwaairst4WmpaNyDaOAOFjNlrdHiP7Xsk4T2/HuhTqIfGgcSJjYzVd1xYCsQY7l/vhUZkOa2hEyxAxG328Qkh/YeE//4gXtH3AJjR+4YWR32dSfk+CIBsFm8tmVlZUCanTrL0FVpFWtgh4jUJqo62DKCDpAhftDvO5x4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upbFfh9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upbFfh9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26844C116D0
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761582291;
	bh=iFUNgXsnYA88I+eiduiUIs6MsVz6z/JWH9W3jdxReHE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=upbFfh9cs0w560m5G42zUAqRYxPzCQhWJ3nOUwjD6MeOlDBIWPgR2G3a88oLebvnT
	 ujk6tCfOjiUqdVgy2MFjKvN9rMWrXIN5316szN6mMd4+uAO0sLp53eAa8x2WovxYUA
	 jxkiAu/00FklIY5zVMLZwqlAGkLcplG4IkbTAqj73DLth/o+LT4ZC333P15SGKcxjk
	 xgrKa1lpY+9VJtRSx9RdhKoB/gIKqlvkASy/W7JdUeifItJSnyB4R1Qs+J/H0/GZF3
	 lLTaw30AqORCfJ+MkMFkyaZL3SVfAfD11Zee/TPOUWl0UAIy2Qx4wFs/swJJfCRylJ
	 dcudLK20iB9bw==
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-430cadec5deso49234315ab.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVD5VEyLH4SOGG4uW2oG/MwlN+1tNhzcxvX1++r0idEj6t+2kouH69T5Mh+hJKuPIsCbT9uIq8UN5EMSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbZlfasdrJkv/frEy/BkLvir+W9CvZufO6OHN9611xVMBjDe0v
	MK4E6JyU2hZog86zLyWKjfbdE5u7S53opk72Wf4twECIHGKSzJOSQPfVIdTH6NIAc0KY26RgHEF
	FOIYogTaRhGrJED2FoBYDTRN7w1yOYCE=
X-Google-Smtp-Source: AGHT+IHHe/XtS2GG/wdvqgHvDv+nRF07AMUFFVC6D3jwE43Y2hKkIN+nB3wIPE0Qg88P86L2vzXtvE/tbccFLfpnpgo=
X-Received: by 2002:a05:6e02:3f04:b0:430:c8ad:81d3 with SMTP id
 e9e14a558f8ab-4320f86b4f8mr8500885ab.30.1761582290543; Mon, 27 Oct 2025
 09:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-10-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-10-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:24:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f8qajMGCYLKPuS_mg73KejXx-OpfQqcdEf2fWDZkDig@mail.gmail.com>
X-Gm-Features: AWmQ_bmGka6WNi4gU3CVi9HH7uDknXm3j3l2W4WzjmEHbPbF7rcEUtNrr-KxlVo
Message-ID: <CAGb2v66f8qajMGCYLKPuS_mg73KejXx-OpfQqcdEf2fWDZkDig@mail.gmail.com>
Subject: Re: [PATCH 09/30] drm/sun4i: vi layer: Write attributes in one go
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
> It turns out that none of the VI channel registers were meant to be
> read. Mostly it works fine but sometimes it returns incorrect values.
>
> Rework VI layer code to write all registers in one go to avoid reads.
>
> This rework will also allow proper code separation.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
