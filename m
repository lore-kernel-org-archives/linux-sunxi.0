Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B67C
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Dec 2022 21:01:17 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id c66so11270224edf.5
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Dec 2022 13:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR2ojr4E4/FvABpHMdPE1tBl2qE5ugC0vWs+LUlEhI8=;
        b=VDtbOT60TvVrEjQjbx0WDlRo+AwmdYcjrF1PiLmi4ycg6zyoil32hMK07venuroC8k
         xQGAzoclaWb1++ZmwD5vfeqyHXv/LoWzHhkd/gI1zSdaxctkeybwYKbwr+JrETj4ZcCG
         aUc/RL1tAcqdF1eKX6cPpa/aNYuVecrawB6v7Gg9loPpZz0RyEQJbRX9ygvI6goe+Ew9
         /3TTuHuJyW3iHms/mnGSkhT0U7+fnuctAOZzyBBMj00YYXptDm9dhOACiqJ2M10OMVrx
         C0mjJn+NENrgAuCkBvybgnWAtAt9eH3lbuo93emLGPkkAJby9m2PYxlA0WUuQTDlmOhD
         l6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oR2ojr4E4/FvABpHMdPE1tBl2qE5ugC0vWs+LUlEhI8=;
        b=D1bZefGTb9iae65jAmNJVS0Inywb74//mUQ6weNiTNdgseWIthMCASlCptgkELoK0r
         sstA9BFqZRfYmpe0MKofb2ReRZy4YVU14+mcSs9+V5GpjqWsrv5/30njf3KU0cFb4VC2
         yCH7fCZR6hBKzmw8/jJKgtwACY4qkOYOYSqKoBM5V76Asix/sJ4m7GGxx9wMIQr2QFZ4
         7bIHS98QiQKuUvCe5H6lKguDCHkkRveCrGH4/l+1sMWEXqebkGEQ09SYRaZJIuZep43/
         wCZQqXkaQydKocXbQhEAfF659+iC7glMI+nFr2VZs6J7Brk8EnHqtYto8jJJNFJKgVeN
         Wt5g==
X-Gm-Message-State: ANoB5pkuzdLmKxKKRgdB5KQvKKp1dUC7wGSPngto7IY6DIWG0Q2Ofecp
	87d5BcI1xWNrgGRzOIoz6Ot4PN0hYZ1/DQ==
X-Google-Smtp-Source: AA0mqf7TE6/gHtnfOWjM/gdQJDtF6FGAYEHlnA9LDGiGZ/bEoqQVQg36nIkcEZaiwGa6wt4FBfx7Jw==
X-Received: by 2002:a05:6402:4507:b0:467:205b:723d with SMTP id ez7-20020a056402450700b00467205b723dmr17483455edb.69.1670274076195;
        Mon, 05 Dec 2022 13:01:16 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906293200b007b9269a0423sm6634332ejd.172.2022.12.05.13.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:01:15 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH] media: cedrus: Convert to MPLANE uAPI
Date: Mon, 05 Dec 2022 22:01:14 +0100
Message-ID: <45143854.fMDQidcC6G@kista>
In-Reply-To: <20221129074530.640251-1-wenst@chromium.org>
References: <20221129074530.640251-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chen-Yu!

Dne torek, 29. november 2022 ob 08:45:30 CET je Chen-Yu Tsai napisal(a):
> The majority of the V4L2 stateless video decoder drivers use the MPLANE
> interface.
> 
> On the userspace side, Gstreamer supports non-MPLANE and MPLANE
> interfaces. Chromium only supports the MPLANE interface, and is not yet
> usable with standard desktop Linux. FFmpeg support for either has not
> landed.

I don't like fixing userspace issues in kernel, if kernel side works fine. 
Implementing missing non-MPLANE support in Chromium will also allow it to work 
with older kernels.

Hans, what's linux-media politics about such changes?

Best regards,
Jernej

> 
> A fallback route using libv4l is also available. The library translates
> MPLANE interface ioctl calls to non-MPLANE ones, provided that the pixel
> format used is single plane.
> 
> Convert the Cedrus driver to the MPLANE interface, while keeping the
> supported formats single plane. Besides backward compatibility through
> the plugin, the hardware requires that different planes not be located
> too far apart in memory. Keeping the single plane pixel format makes
> this easy to enforce.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> 
> This has been tested with Fluster. The score remained the same with or
> without the patch. This also helps with getting VP8 decoding working
> with Chromium's in-tree test program "video_decode_accelerator_tests",
> though Chromium requires other changes regarding buffer allocation and
> management.


