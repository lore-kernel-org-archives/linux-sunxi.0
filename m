Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A9320397
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182705; cv=none; b=Fc5mLVEZiVt3G+3qR6u8+fF1XW9tQ9BubWgT9vEf04wsa8QRNtcn6fb2QX9citORtyUpR7oh2mdFhnDilrnhJxL8sB8JMexK/P1x8cx5A179HFE8DzfSVF9WXVyfPP0hnv4CJNOcAoFKg+HlN83JopcOzlCgxPwpHVpjnZMhNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182705; c=relaxed/simple;
	bh=1GaNNFCtknV83Jv0cqtYzHzLamBzWC1xpyIlAkgm43A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLK8x0+mGFNAYZflCZ9W3E5tPbcYgeXiq1y4uH9a+5Zw97oC7qiMqsYUMv9utm96jxPn4iyUzGhYqnQnMusH+8pm7rZeFiBt9Oy6XNqkEpHboAs0Mw+zmcD/WaQauUT3IxzGtRZoY/9KO5kCb0mpEXlWxDjx7gy13Q921aL37YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/+PRojJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/+PRojJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B296C116C6
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762182705;
	bh=1GaNNFCtknV83Jv0cqtYzHzLamBzWC1xpyIlAkgm43A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=I/+PRojJO4YN8h2bvBzoZeo7h6nDwnL4uefQQ0bkGpg0hgJyjWPTgYEx6AdTd5QJp
	 AzTwDamL3PBHLQjiuApsSqieDLII7glvyihzMk4QqVa8TnIkan+uP6eIyG93znND1+
	 JKnVe9R3de9Eop1zv8OZPMzRuOwAY+0r03H93pkuKe5ENGc7xZJRuuWxc1srof2LwV
	 IsH/gLKF8vbbaDS5nBuB/cQ4B+Vg0S9sh5SX7jr5o2T8L59JcNXvBB/PSXOov+iJbn
	 ian9DlT39jN7IPbmsG2kDWdTkVBFssO0Od9kxeNeZWuUZ+onjLjiYNBZoN9FmlT/9s
	 jEz2SSuoi4pkA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso21583331fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 07:11:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3J7KCQncn/B7+y3/HiEQYKRdvLajx3pbPwA1EYdBFk4j2CpwDcR06kBSl/8uNecB+76I1QzVA+2KS2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK3iKtdb9FFxEZ2tEB8Pq8NBrxqBLkUeUnZ0l5fY+SQ2e3DJah
	z9Qo8xfFajfiGwnxlLdr5AlDsDpRs3Cp08HptaCCja5aPJDj5B8wNoZoMFyoVXqyzNMSyjYAR1i
	bNZ9QyAM7B8Jt3hQtc8BsUoB4S3hxWBM=
X-Google-Smtp-Source: AGHT+IGWElttgB4rVGH++HgAV2+aJjHaHeGIca+Uf5ByxP1uF8tUjDilXB/buasyrsMUHZXVPNFUTSxNQSiSwWns+Qo=
X-Received: by 2002:a2e:8848:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-37a18dc65b7mr29472661fa.29.1762182703902; Mon, 03 Nov 2025
 07:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-23-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-23-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Nov 2025 23:11:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v663GuEnxxVK0v+zOJ=p_HbqmJjFhP45_9FFvhAtenABPw@mail.gmail.com>
X-Gm-Features: AWmQ_bm-fOqGieMMsHUhvs-YpT1nnfXeuYJQ_6Z3gI_-gHcMItjN5vkHcjHc7cg
Message-ID: <CAGb2v663GuEnxxVK0v+zOJ=p_HbqmJjFhP45_9FFvhAtenABPw@mail.gmail.com>
Subject: Re: [PATCH 22/30] drm/sun4i: layers: add physical index arg
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This avoids plane mapping in layers code, which allows future
> refactoring, when layer code will move away from accessing mixer
> structure.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
