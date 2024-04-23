Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C628DA5
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713853711; cv=none; b=VAEUoxiQ6frzSxfm0A0kkAIupqQoV8Q6hzJHY3mkeTYW0aW9MVD1XDvDcmZtjX63cBGSb2Ol3sSggxJsUj6EyFtcJ1dtLo9d18Tn7eEHz6B7wwZ/j9pXjwvLE5g61597oNMVMc0zfJ4iQPsXYYKENn1yD+s2cGLQImqRiyJYE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713853711; c=relaxed/simple;
	bh=RH3seyAGfFPN3Z3rV3vpTCGAc0jmROThGRyFEPOs0fY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfbZl1uV2CuGYYfzJGxBR0KucXTOgyDe+z3Te7jMuq0EslahgnO49IraK2I4jHnYUhegjECSbEnGUxsKMsmMWfubl1aCZJUAvXrsy3bWdLy5RO1fER/yKgYmL2mUhR2wWljMReG7LAOdiOUujHN48Jwl95V9IHhownumVaB+6iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyNv+uyu; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyNv+uyu"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a9ec68784cso2944515eaf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 23:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713853709; x=1714458509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vf4nYaIAsDBcjabT8ATdtFaulkvwKXK93mDR85Qldw=;
        b=RyNv+uyuYqEEuoowF9OWgrfU9MUx11ngynk6ZYtvdqvfgOGGc4RJjeB4ejGjGtaX66
         xM/x6ADM80KeHX6PEwSefqh9V1/QPX/Cl62P1fEbi++NsLT4Nm+Pf7hhqJwlRjrsZ8XB
         oFWHVEB4GxRPW+L+Tv8bQDhzAQEkmiessaBrp04Ey9OC/grylbhfTuadhtaZHaWIZer9
         4pso2+ZNGqP4iFf8wrNZ6TCNb/prZL1W98xidYpcW60DUEecJeoeKRG9E/sxPo1y860T
         D9/lvKN6aLkqQ7Mc3/cdMoSGB92tTYynUlDq1KuE9h72l40Ui3AKvl0EOwuAUZ+DoO9A
         QGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713853709; x=1714458509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vf4nYaIAsDBcjabT8ATdtFaulkvwKXK93mDR85Qldw=;
        b=bSItCIykXuBLNwwajderSgvMqKJTbUlJnKp3Sifzv8+jUu6doO6dJomQ2okT4BnRja
         6C1fZqYsCz7VDygNt0tFE9QiL8NevcgQhZkAnRt4t9nqGGzZSnO/cJvFBf02NDUEhBOt
         DxzU1fsAzXt+RHZg3lM78HVsWwutq+4d15TKMNBrqRLxJOiR7DQxvh3/pA1xvEbB0HP8
         LpzuZjAG5xVWx6ol+25Lf3LhjIa0qtzKt62PDDz/8tNmnaws3X1uylo5CL3KqzL850ro
         7wnukrzbkJCZjYPI74uB6hLKGC2il199ATThMDQCbhw/mRYAskpiARkk9+das+vaDRVM
         94QA==
X-Forwarded-Encrypted: i=1; AJvYcCVMGxZQk0rmSs4jDCcBTrL43yxxD9B0FdP27dGXTQXN5YuNlBNaaNwrzRtBGuEHSTWUFZteS95YvWIXFDFyffev2buue22Eu/PbJGY=
X-Gm-Message-State: AOJu0YzueeZ/rxca/R6NaUvYxbAcD6cveSikip4unPQXXXOdmm094NBO
	nOQQ65HdGOwbNNSAHB086vJArAVnfoa/SGSAn20qhCgtSIQ9+5qC6SuBTx4IhYuj1RrJfXq+S+/
	DbHQhc3XSzmhSP3VWrc4N4OE3xMQ=
X-Google-Smtp-Source: AGHT+IHaoOz81cM8ZgYwCcdxP+mHIRu4dpEwXHfWhSWaZ015706PToTI3XgPgElilbHdEWRXiAb4Nf0V1X5yJDKNKuo=
X-Received: by 2002:a05:6358:5e83:b0:18a:5c27:7032 with SMTP id
 z3-20020a0563585e8300b0018a5c277032mr15515881rwn.13.1713853709291; Mon, 22
 Apr 2024 23:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <285de20a187f3e4baeb28f639b5bf55e914a3821.1713756666.git.viresh.kumar@linaro.org>
 <CAGRGNgWHkVkOP13jh-w1KQYeR_yeq1JgOt9a+R40F8DGYKMtkg@mail.gmail.com> <20240423061253.blyfuqasyiatm5sa@vireshk-i7>
In-Reply-To: <20240423061253.blyfuqasyiatm5sa@vireshk-i7>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 23 Apr 2024 16:28:17 +1000
Message-ID: <CAGRGNgWH7PW4fgMOYtEVohrPq0MVusKFOpF8GXCbMDA5D7BScA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: sun50i: Fix build warning around snprint()
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, kernel test robot <lkp@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

On Tue, Apr 23, 2024 at 4:12=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 23-04-24, 11:38, Julian Calaby wrote:
> > On Mon, Apr 22, 2024 at 1:31=E2=80=AFPM Viresh Kumar <viresh.kumar@lina=
ro.org> wrote:
> > > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq=
/sun50i-cpufreq-nvmem.c
> > > index 30e5c337611c..cd50cea16a87 100644
> > > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > @@ -208,7 +206,7 @@ static int sun50i_cpufreq_get_efuse(void)
> > >  static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
> > >  {
> > >         int *opp_tokens;
> > > -       char name[MAX_NAME_LEN];
> > > +       char name[] =3D "speedXXXXXXXXXXX"; /* Integers can take 11 c=
hars max */
> >
> > Would it make sense to just set a static length for the string here,
> > say 17-20 characters and add a comment explaining the number, say: /*
> > "speed" + 11 chars for the int */
> >
> > The string constant, while it'll probably be optimised away, seems
> > weird and wasteful.
>
> The counting goes wrong (I have done it in the past) sometimes and so
> I like to explicitly reserve space like this, it also makes it look
> cleaner, i.e. how the eventual string will be named.

I completely agree - ultimately it's whatever works and either way
works equally well.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
