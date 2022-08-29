Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E82F53
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 19:02:46 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id j17so6874511qtp.12
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Aug 2022 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=pIxGeluzGYEKzBZac878nAVYb/MGQD02kaqzGhI5soE=;
        b=grYLPBfbpBFgKFqkSlWko72q8lwjufsjsE/1/jVNSz8M51ZLimPU4INaXeTpCGwbqu
         fpARIQTikb4m+fTiEvbEdTOUsCbm87y6kmK0y/IzPpe+uumC/F4xqZdfNn2rlMbsyY/j
         2ZgKYd/EfMOVNwJaLRlFuQfRnSWEgfHVdHM7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=pIxGeluzGYEKzBZac878nAVYb/MGQD02kaqzGhI5soE=;
        b=mWUgB+RV+gRaMBk2kp/QVspSX0lQVT69FXDhKIpeUNSYtwuQG/n1SY8KfZuNrcnuXX
         ISmOZ+0U9QrargftV6Fo27nylAyKRvLhItyoF7JS+cq9xqGzeKbY+hfC96Sc55DZz3Jl
         4tWh8LbNYNOI7wIUEg8U9WJoBwD/EzpIsR0c8zcZ5xDL6Z7SL3R3EFmTkUbcf1CbikEs
         o2cGdZeYAWYxJZ34/B2kMBTnYhmwafbT2xAsVmQiQp2YAXIflxR6jEEF3j1pUPnNAw/o
         hlqhp6WDkTGl+u8AAABNXtLQFykInYyyXnh7ai1UTxewS6CPQ03z7CmQaCmel8jkSm5g
         ij+Q==
X-Gm-Message-State: ACgBeo0GooRRoz4Rl2EltISb1DpBeqDHy1HSPT1dw0WZv0wCCbvFQ0yj
	E2cwjKsAyV9Nj+02FIjEFMNI7g==
X-Google-Smtp-Source: AA6agR7cohvIoKMHY1SJ+uPe6QOIMSrdGY61QE9x43N6PZX9CYY3REZteRsH6f6P7prXXMGQNDmESg==
X-Received: by 2002:a05:622a:14cd:b0:344:6cfa:42f9 with SMTP id u13-20020a05622a14cd00b003446cfa42f9mr11639737qtx.147.1661799765067;
        Mon, 29 Aug 2022 12:02:45 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id t17-20020ac86a11000000b0031f287f58b4sm5405223qtr.51.2022.08.29.12.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 12:02:44 -0700 (PDT)
Date: Mon, 29 Aug 2022 15:02:42 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
	Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
	Chen-Yu Tsai <wens@csie.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Lyude Paul <lyude@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
	Daniel Vetter <daniel@ffwll.ch>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Phil Elwell <phil@raspberrypi.com>, intel-gfx@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/41] drm/tests: Order Kunit tests in Makefile
Message-ID: <20220829190242.tk2hinttzzmzhnaj@meerkat.local>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-1-459522d653a7@cerno.tech>
 <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6289e5d-98e3-1a0d-f514-136e2b7978c1@tronnes.org>

On Mon, Aug 29, 2022 at 08:46:42PM +0200, Noralf Trønnes wrote:
> Something has gone wrong with this patchset, there are double line endings.

I noticed this, too, and I think the reason is because these patches were
generated with "b4 send -o", but actually sent using git-send-email. It's not
a use-case I've considered (or tested) and the breakage is because when b4
generates patches with "-o", they are written with CRLF line endings, which is
not something git-send-email expects.

Maxime, any reason you went this direction instead of just letting b4 send
these patches directly?

-K
