Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74F70
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 16:34:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id gn26so2355380ejc.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 09:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=EKlIIriH1YdqSb1pxgL7ZptynJiffhm/TmzboG1am/A=;
        b=lUVvWJYvuiLQnfXJspEil7089JbpY1uZqt/egr/K2YdAX75RE/mEw5fwK1bbt65n0B
         1qB3Ob3TutooEO6kEWMdaJntgBJtzxDOiQbbpW3TOpVOrE3CWm2CfHNx7JY0WA3DozxI
         s1zcKwRVm530qgTYhGVmfQ6Qa4R1tJmHFJWn4nFj4mt+Ce5u6PQLtsU3qwPTZWQmjcsT
         P9rRE7CKl9PmN1id5zDCyKIMvRRp4mAI9B/B1PcaQU28GTas+lW7LZa3vpuHvj1K9l2k
         8m7tQfLh+t1ly2t/q3vPQCiRjZ3NF4u4nFZVKDPQ/z3rkA8LNeXY/hKaJD+yzj9sZ/aa
         1nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=EKlIIriH1YdqSb1pxgL7ZptynJiffhm/TmzboG1am/A=;
        b=s5rZqsDdq/unuMl08qJXOLpmRZFWhORz95rhGFKLeqLiZnU207708HtFRyffshxb3t
         q4/ylHKvPgFJfOlS35svsDSoILH7jSctsaMJqRSUhL2EJMYYqJkjh2CuaBWmPsSE5Zsz
         NqsnGG/oeMOJS2yFc3tEjUnU2B0CUYg7tWAoBmTLvXrZnOWClaCOab9Yw+xNDnnv/+0A
         XV/rMQ89SUmAmamoVqz7Vi4LfLhfPUV+ojQbG2cAFJDC0vBGKbQRtAWYtICZ4kunHzHS
         RoBTz5JX8woZbt7PCCf1XzyF+GCCW13dF3yTUM/ifsLqxzAgcTaa1WUUUxHbpVBgQWY6
         U0iw==
X-Gm-Message-State: AOAM530XYsrREk45yqeRS0hEwaOAPrRZvbLnPaRPsU6i9aAu0oP1wwr5
	tFsj7qGFlJ7OdMWW3zACsLk=
X-Google-Smtp-Source: ABdhPJxqy7tsOHJCVIWpFbIe6L04u3Kjmk/YnsPYeJlbXEd9WWjSftj8Za/1zNQ5WUNmBFK0+Z4lmA==
X-Received: by 2002:a17:906:3787:: with SMTP id n7mr4917418ejc.435.1627144483747;
        Sat, 24 Jul 2021 09:34:43 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id ja13sm12457183ejc.82.2021.07.24.09.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 09:34:43 -0700 (PDT)
Date: Sat, 24 Jul 2021 18:34:40 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Felipe Balbi <balbi@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sunxi@googlegroups.com
Subject: Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <YPxBID3rk0NY5IC8@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik>
 <87zgub6a25.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgub6a25.fsf@kernel.org>

Hi Felipe,

[ Dropping Greg and linux-usb@vger.kernel.org ]

> Hi,

> Petr Vorel <petr.vorel@gmail.com> writes:
> >> > [1] https://github.com/linux-sunxi/sunxi-livesuite/blob/master/awusb/awusb.c

> >> Why is this even a driver at all, it looks like you can write a small
> >> userspace program using libusb to do everything it does, right?  What
> >> exactly is this driver needed for?

> > I'm sorry for not providing more info at the beginning. This is a driver for
> > host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> > to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> > only in binary form. The only open source code with GPL v2 license is awusb
> > driver. Thus I thought I could ease my life with upstreaming at least the
> > kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> > Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> > use something newer nowadays, but I haven't found anything in their wiki.

> looks like you could implement that entirely in userspace with libusb ;-)
Thanks for a hint. Yes, whole thing should be able to implement in userspace.
I'll have look if I'm able to reveal what current userspace code (LiveSuit)
does. The goal is to have simple command line tool (no GUI).

Kind regards,
Petr
