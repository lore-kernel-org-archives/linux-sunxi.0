Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B14EA6
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Jul 2022 09:41:37 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id k85so17145147ybk.7
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Jul 2022 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fOvbxuv2i/5Fzmz+3Q/qIWhDdrS7QG5wOKPzGz/uIY=;
        b=G3ldbuY+mWVn7ay3tMVHD/zVJ4BIpuzDiqmOUrL9SZtu6moGWd4rAPTZqsejlKf3q+
         yia8d++1RE9vr7d8BKUzuJih3iYsDhRndNPYzJtGPsDBs8IWzb5iPSPiun4IRIO/LEN/
         17tvA/OeTpsA0qbadS2ZCrODA/MY30gkZ2BUkc20mH2yNCeMy+U8hwukifQs42YTzFbL
         4iQxnLCjX4HYCKnVaupqTes4Kt9vVg7H26chsPzMoZIuuQitXLWbjdTCsLmBc9rld0pY
         Bg85u1C0QgW1d71VlR62SQT9BaTljmaRxhg+FZmtpxlRKXaWxQ5C7MQoHCZuH109IlEW
         c41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fOvbxuv2i/5Fzmz+3Q/qIWhDdrS7QG5wOKPzGz/uIY=;
        b=zAX4pfdUUx/QkO0H8HO7ZVexNmcF5beX22HDUBbbr8Xw3h6ePNqbJTRCdKtT19ap9W
         enNkGHHTLbraXClhwwsn5V44kS+RyYObZ3AUCUdBc6g/OYgOcin+XELl3msGCV9hlXDJ
         sV/B5VbMRUHW5f8qGELvnDwyydid1lAQBQ0uYRX9V/UEmrv8pnlNqrL6iEmDRQ31HseK
         1Rqf7WMvPNHmUfydwINaIlIi7xYJjJEXZYe2AnTLd/ETbZAWLacedRFDuQgQ/oRFW5c6
         oGjmFHeEbne/JQs2bdnBTT+XSghZe3H0vLwbWM12UFP+mEiCP9C/8ejCp3ESLO8Vl28w
         OfBQ==
X-Gm-Message-State: AJIora8RZSQqg6QVv4Z9XXeXs2Tshh+pm0WwKt5dBwqRlSOlk5rBpSx2
	W7GhJmJpcDq5MUoCPkq36uPoM3lq6QwYqlaq5BPoHQ==
X-Google-Smtp-Source: AGRyM1vAtV/OOZgvx1kKG3FvseqMLz6Z/yAiXnzUMl+LY6h0es27TmM8UASc1JpZ0HuCq+s3wHStVZi2IjNSqN7I20I=
X-Received: by 2002:a25:8c91:0:b0:670:5c00:7c6a with SMTP id
 m17-20020a258c91000000b006705c007c6amr1238342ybl.66.1658137296329; Mon, 18
 Jul 2022 02:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YtH53r9UcYwquxcx@debian> <043cec12-b719-e9e6-d234-fe6ca75ca894@gmail.com>
 <a15dc5d9-ed10-d75b-3e76-e5e03ebfe25f@sholland.org>
In-Reply-To: <a15dc5d9-ed10-d75b-3e76-e5e03ebfe25f@sholland.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Jul 2022 11:41:25 +0200
Message-ID: <CACRpkdZ6yPUd0KPLqviB_ufiEe9dz3XyP+JPkP5ujKc7xYYKVw@mail.gmail.com>
Subject: Re: build failure of next-20220715 due to "No rule to make target"
To: Samuel Holland <samuel@sholland.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 16, 2022 at 4:15 AM Samuel Holland <samuel@sholland.org> wrote:

> The patch in question[0] contains the new file, so something must have gone
> wrong when applying it[1].

Patch 6/6 didn't apply cleanly so was applied with
patch -p1 < patch.patch and then I missed to git add the .c file.

> I wasn't sure what to do, so I resent the whole
> series[2], in case the index hashes in the v1 patches were causing the problem.

Fixed up by applying v2 now!

Linus Walleij
