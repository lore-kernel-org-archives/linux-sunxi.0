Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AF333ADA0
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 14:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202683; cv=none; b=B9p3k8amY1X9OKnYCIaQQIdgFMof+1/CO63+c3AfYUoFucYNSlufdma56v/6gfgUrqq40SiKoiW61XkTI+7VlHzQwi2Y0RP5QVNodrb5L1GkjY3aZm1gMlbIXJIhkud9VJUO/o4cOmbv5Ohd8H4Ipg6ee2YxfEapWLchb7P4DJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202683; c=relaxed/simple;
	bh=v8YjP9Npno4O4XTZSmojz9CpByYqxe69fUnIsHVXY3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwvjUOJoeXI8cRielD0liE8eZDf6BW0BDNlkBg4mQxLGFXWMhghaY7DoEhVMGvEcuvgzNeS4uhdXHMIMj6bzolb7Xb2nYn50HGYMtXGBn3abBkAeRjT345aR1pP1dkQkCKL5YXCU7CrMKqD0eGjILJGht6SEh5O1SI5uTm99gX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umrZTPQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umrZTPQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3145C2BCFB
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779202682;
	bh=v8YjP9Npno4O4XTZSmojz9CpByYqxe69fUnIsHVXY3g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=umrZTPQB5Hn5SzscWM6sns7PJzTVHLIadzM9TOv/VGS1aN0lLn7hicuyKFk8ymv3D
	 VmSHhQfH3Tq2WVhFwYOopA9R6tV2RuoyKATBTGfyzvKTwH9vI8jmMxrXcVg1lcq4EY
	 kEl8PtsuW0WnyTYo9Lqau1Lq/aQFrELXE19QyyBgQ3kjTvStuCdTNK0japzEaOBvWH
	 JD5yphtMM+tdwj3+05ZdTH3jwT54Fr6jsCUQk14OexOkFgihpDXYXzzsxfPHVwBfOt
	 +2RvxKFhHcqRU1mw+62rY3Wd60cSpviwugeSFWaKqBHiJtBLnXaRwCUXx896utmckd
	 KCic15yCA4amg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e7d983f91so39147081fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 07:58:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8BExq8sZZGfjctTebKTgND/LdArixzsGb919ZRTBx+lb5ZHcGnZAtjBgP33qaJmlG2OUyUZoH5EQ6ocA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7MuRZ9+N6Fo/6G7fYBwezvvESXjcaIpWm2XL0Wt/6o4Qys3QI
	yY4I9NUBG2yGWD9ERAYVtY4QLJB0eURpZeqlmCnapUvQ1x/qpvQTHoqciHLKE0lIS+84YNqykqm
	PTBnC/1TsNWUUZR9G/h44MPsDHvhRvtY=
X-Received: by 2002:a2e:bc20:0:b0:393:a2ec:da34 with SMTP id
 38308e7fff4ca-39561c36355mr65078351fa.10.1779202680929; Tue, 19 May 2026
 07:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519144712.1418302-1-javierm@redhat.com> <20260519144712.1418302-7-javierm@redhat.com>
In-Reply-To: <20260519144712.1418302-7-javierm@redhat.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 19 May 2026 22:57:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v64354S65SxU40Lp9K2ous=OQO2QujD0L4d9iF4=reaMXg@mail.gmail.com>
X-Gm-Features: AVHnY4Kflsk35TrUBM5-9zDiyDqHDodSOzLTF9r2I5qXft0UA_EkYXejxu4fC40
Message-ID: <CAGb2v64354S65SxU40Lp9K2ous=OQO2QujD0L4d9iF4=reaMXg@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/sun4i: hdmi: Use the common TMDS char rate constant
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Samuel Holland <samuel@sholland.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 10:47=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Replace the 165000000 magic number with the shared constant defined
> in the <drm/display/drm_hdmi_helper.h> header.
>
> The old comment referenced "HDMI <=3D 1.2" but 165 MHz is actually
> the maximum TMDS character rate defined by the HDMI 1.0 spec.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
