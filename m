Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FFD2C80
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Oct 2021 15:52:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id o20so68118117wro.3
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Oct 2021 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9hjlZVhXoXo3FL11esprff5bCUJHk8umIxjYSUWWgeI=;
        b=kV0X6h2dQAv2MkM2vrW6GjCGiJI0xIG0PHHSVveSz2hyjC8lk8aMORT44wf492yBY1
         KBPSvLUoNxR8Em6FU6PL5kNNE5AWJ+K4PqUcdQhTiDLmJB6i1afD/q/xuDojGWMjGy6p
         TteAbpw7kviXf+aoTS45z0NBdEm9eS4jTmflE4qXJdhSuMoQr0zOQGciG1rm7MvDL7Z5
         FoAmvN/17V1px+kALM8NPM0nrOiNO8Ru15yur/HY4FXwkxFoDY9+a6u/mdLwqu53L9+3
         l08Rp8EAsF9ryAW7fCBLH8KlIhnVPBOZBVxhzU/VPtTn6nzxPw5uCh1b/vmMn5dvRI73
         YJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9hjlZVhXoXo3FL11esprff5bCUJHk8umIxjYSUWWgeI=;
        b=vZ9MKCuAhcmhM+q++vViy0L1FNlJ4kTfSBNx0+vHAovSRzc5nmgvtqi7+6eWtVsZTh
         LfKHGeay4uDvPSogIX8yy5aiwMvrtXFzL9LGfSI06lesUKwX65CbQgt1U09KYJo2iqqv
         +gSMxyfug8il8xUYv2qhFuLqwWEiFA3+RxwHU4HYg3tqsV+8/n4tYhXkVOfqm01GVMhF
         cGyJnoU+aoloKOgqQNbrM4ijGnuMGZyq5y3WIHe0QZT0zmEUPXs2ScPQ6nQpVTdpR8ur
         q7AVNo1BuldPUGc9txOXYSjbmXT2t5KDI3yUGg2ahMh+PHtLMmsYhZ0+P10sID2eiDnV
         TP/g==
X-Gm-Message-State: AOAM531HuS/6aixPejcEVhPRoWVHL37drVBKg+JOkYylCAnmUc+/8has
	WDXJI4IZtrJBOovObdWvTBfPpA==
X-Google-Smtp-Source: ABdhPJymeTTqFwbQopH1XYOQsNuPgTZb78WfIdf0kD+JmZX8+BYbhfIbLHpTNtRFuzH7N1t7JtCmgA==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr6390465wmj.10.1634053926395;
        Tue, 12 Oct 2021 08:52:06 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id s3sm10875737wrm.40.2021.10.12.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:52:06 -0700 (PDT)
Date: Tue, 12 Oct 2021 16:52:04 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
Message-ID: <YWWvJKs8K9Z8WIGV@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
 <YWWg0PjnuBCKO3Tq@google.com>
 <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
 <YWWu+t487giK/FB2@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWWu+t487giK/FB2@google.com>

On Tue, 12 Oct 2021, Lee Jones wrote:

> On Tue, 12 Oct 2021, Rob Herring wrote:
> 
> > On Tue, Oct 12, 2021 at 9:51 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Tue, 12 Oct 2021, Rob Herring wrote:
> > >
> > > > On Fri, Sep 24, 2021 at 2:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > > > > thanks to its device tree binding.
> > > > >
> > > > > Now that we have the DT validation in place, let's convert the device
> > > > > tree bindings for that driver over to a YAML schema.
> > > > >
> > > > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > > Cc: linux-gpio@vger.kernel.org
> > > > > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > >
> > > > > ---
> > > > >
> > > > > Changes from v1:
> > > > >   - Removed the example and moved it in the mfd schema
> > > > > ---
> > > > >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
> > > > >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
> > > > >  2 files changed, 55 insertions(+), 75 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> > > >
> > > > This one not being applied with the rest of the series is also
> > > > breaking linux-next.
> > > >
> > > > b4 am -P_ -sl -o - 20210924071614.868307-1-maxime@cerno.tech | git am
> > >
> > > Thanks for the link.
> > >
> > > Seeing as there are no *real* dependencies, it would be better for
> > > Linus to take the patch (if he's okay with it of course).
> > 
> > Only that 'make dt_binding_check' is broken for anyone using your
> > branch (and linux-next ATM). It's as real as a broken build due to a
> > missing header. If you don't think this is a problem, then don't apply
> > MFD binding patches.
> 
> Ah, I missed Bartosz Ack up there.
> 
> Happy to apply it.

Linus, Bartosz, do you require a PR?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
