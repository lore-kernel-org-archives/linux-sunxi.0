Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFAC7E1
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 18:42:51 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-563393b63dbso24233eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jul 2023 11:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690396971; x=1691001771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHGJiTdlB+dQD70EMhHhI8xvC4trd7Ff2YAN4Uy5bO0=;
        b=JqqKT/tB8ga9a1tJ92Iy6rvIhMk6pBPgJ5QeldoEVQ2+tp1iFkHDtnsiSoLvub4Vly
         O1sHy5QRE8Uvt1HJiVDjjxQGFaT8TWrjMHTaLNVrnW+XRHNQw7WnKorQ2TG4lmAzEhwt
         oGlnzS3KMh5WUAMT2Ktc2nps7OfZOBEkSrd6kS72zFngLZi78fwMAMYAftPaJYrJ3jF+
         a6hq6wAild/YgudySqDdWFXCWOxwV7P589r2Cn8OMiP/3xF4EB5LzTNBaAheCVc8qdCz
         3oxHsDm/FCkyHIcAwiv2z7hE/OpiYqUQEZ9Ef5dBnngJRQBf7QH+UulOrHnT7DPG4EvQ
         MkWg==
X-Gm-Message-State: ABy/qLaTmSiCFZl/4KeC8VtgCc7LoNMVJUSk5yMpYLGnA6j0mpuLCceP
	+b3lq4SIx7MA+gizPMF2NuebIk+9I3Z4wt/AmIg=
X-Google-Smtp-Source: APBJJlH2x90Q7lDJXp2zFV9JTsLkAsPOTtP2AQhhIx6ipnMvhPSFtKFj5OTgP4amlKMBVmsiWEo6/1u7nvN10N6++l4=
X-Received: by 2002:a05:6870:3291:b0:1bb:8ff4:1830 with SMTP id
 q17-20020a056870329100b001bb8ff41830mr2906100oac.3.1690396970780; Wed, 26 Jul
 2023 11:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230723-thermal-fix-of-memory-corruption-v1-1-ed4fa16d199d@kernel.org>
 <f559a614-93d5-121a-8ff3-0da77bc85f44@linaro.org> <ZL054LHAZv8VmIk3@finisterre.sirena.org.uk>
In-Reply-To: <ZL054LHAZv8VmIk3@finisterre.sirena.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 26 Jul 2023 20:42:39 +0200
Message-ID: <CAJZ5v0jJ+YM=7LUEKB_b5GUsGopLTT0eyPmomYV0OcGQp2gvig@mail.gmail.com>
Subject: Re: [PATCH] thermal/of: Fix double free of params during unregistration
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Will Deacon <will@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 23, 2023 at 4:32=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Sun, Jul 23, 2023 at 11:57:52AM +0200, Daniel Lezcano wrote:
> > On 23/07/2023 01:26, Mark Brown wrote:
>
> > I think this issue has been fixed by:
>
> > https://lore.kernel.org/all/20230708112720.2897484-2-a.fatoum@pengutron=
ix.de/
>
> Yes, that should fix the same issue.
>
> > Rafael ? Did you pick it up ?
>
> There was a message on the thread saying the patches have been applied
> for v6.5 but I can't see them in either mainline or -next.

They should be there in linux-next (as of today).

Surely, they are present in my linux-next branch.
