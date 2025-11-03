Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE73C320A14
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762189231; cv=none; b=HOr32lhgjzXHhFfMHV1u3E6C13frk63Qog5Q1AuB7zqYdUUPKYatrGVG2p9YA7llEGcR+7xTKZGB8hKe+6Xc7fdnXkKrEswoLbR4E9o+p6HEuKWpVO8gQHtebhrlSImDE99jEqmcDayqaeQo2UNw5iloP3F2Mmvc0dljvIAVLuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762189231; c=relaxed/simple;
	bh=7CyzY1gi2utCnEO0mIJFk4I0teKsCJNbeXckClXmjAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RS6NPraQCKDYOjMW5MJrGudmNqGhX7IK8hPfYk5eC/ztapNXGJ88BvD99qZSAyY/wLSusPW7EXqcEto9KLyP4H47ui12o2VUwNxgvkQMfJ7eFFVCo4752CENpC9RRLClvPWEwsF5O1E1Kse6XcxQorNMMdiVU1sUEIFSFKWaJ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP30ELTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP30ELTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B038C16AAE
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762189231;
	bh=7CyzY1gi2utCnEO0mIJFk4I0teKsCJNbeXckClXmjAw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=JP30ELTUudyhVsNf8Z28HixNPHuIblFoxzdt+6GKSZNVKcm68JNvQJpbCm5SoD3Li
	 kPxz8aWYeBVNE/ybrjfVw8WChw3rExRtt0RqqRSX1f+YILweTNONW4VyLITZhAesmr
	 0XHx5b0Tqh3VHviyGrZQLx+GK2gMq5LGyTNxvp2cymGy7ex7+LggtONVv8SoC8saRF
	 ixOV6B3iUvawEuT2FJpdS2T+ecjF/RANMvXFrf+FWtPAGYqiJhA4ND+zS/Tlu4rCTG
	 awXxUZuzNKA+t0tiQbE3IJAH12nHGyqht1iGtxLFt6HAN4CG1GjGT42F5yiox5+U82
	 j+khydXWxwLVg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378d50e1c82so44497691fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 09:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmfBhUb1nLDQ71LMc1uSdfUozQagZI+hpDiyr9h2kwQWjhQrvbcLsR0Hip1wYWbrtcT5Wg7+gTKGX/7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw59bxDnaa1N7cATsbSyez9oHuoGBq5KnYhrcXT3PhJ+FuTLOw
	646JdB2VymVmiC5uLPMpy5sT4NTFBnojMgqtRYNsAnnqHpde15wjodnEA+isWubj1lmts5ht/9B
	hj1NF8++KUMoYeXTV1QNN4RYQaDPkwv0=
X-Google-Smtp-Source: AGHT+IHVjRCJBpIQ0AkwGUkv1Oc/Iw1YpvgPMizZQAfItAe7f0KiKtYYqyVs+d6rQlc0MN+lNmy1tI7ZB9JGHs18oQ8=
X-Received: by 2002:a2e:7c18:0:b0:376:39eb:21d8 with SMTP id
 38308e7fff4ca-37a18db1eeemr34990161fa.15.1762189229761; Mon, 03 Nov 2025
 09:00:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-24-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-24-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:00:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64sMNZQEjZdofw_=pWYZ7VPa5zjFjrRBZu4tH+HrusZdA@mail.gmail.com>
X-Gm-Features: AWmQ_bnJun-VQPYKNpyT8f9hlvvkp9be9LX1bH3OeeZGxyWdWrG0bvZZDFNJw7w
Message-ID: <CAGb2v64sMNZQEjZdofw_=pWYZ7VPa5zjFjrRBZu4tH+HrusZdA@mail.gmail.com>
Subject: Re: [PATCH 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
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
> Now that channel base calculation is straightforward, let's update VI
> scaler base calculation to be simpler. At the same time, also introduce
> macro to avoid magic numbers.
>
> Note, reason why current magic value and new macro value isn't the same
> is because sun8i_channel_base() already introduces offset to channel
> registers. Previous value is just the difference to VI scaler registers.
> However, new code calculates scaler base from channel base. This is also
> easier to understand when looking into BSP driver. Macro value can be
> easily found whereas old diff value was not.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
