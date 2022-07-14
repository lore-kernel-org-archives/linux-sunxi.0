Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BDD4A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 15:46:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id dn9so4137289ejc.7
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=adLCRjyG9ql2dpnI6XTEKDQmCPOfQAuHG5SMH18mDPM=;
        b=GUjfArcxHRm0/PWidPnP5+up2cPSBhcf+NbNQJSDjl35v8MRismPbEPQE+JFGwEe9S
         p6PbGP2SmmrNCjVsXkLsEYF9SyyPm+epMA490reQCc7WGu+er60puPqonmvwKGyiq2p2
         E48rZ2jY6DJZnu8aKHuWLJV0H4PMaQWLV5U2LOgXNxQMssGGsgWAoeB6odtN+sV99+Kx
         5tDhGoeMsUnn7D/GPwzDwidXAtNNNwYp7ps0y2v2LBYN8w+DKDN8kj2qKeRSshbXW8/C
         NujTASdguIyfKtgy7KGeEj9heY4j4bqnVNJLjqpj84lYfxepZIfvf1kEiXcBvId0il8w
         KnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=adLCRjyG9ql2dpnI6XTEKDQmCPOfQAuHG5SMH18mDPM=;
        b=X7yrHkJzLz+SkdYQCy6zrD1mU/FzE+uUx2vboq+vuUxxPVNrxKNuL34x2qodMztzo0
         JXAwCytmzNXFT+QQOEXJhtNWqcYyw6ZpL4pBsMwuGNw5W+EpQvf7LtVNQAeohbrjvl39
         m53YIgr5WjfiAAsmnxySFajHDZPNcfF+PH1PqCS7OGBU0Fg2ByUsg1W7mJXjQ93mOcWX
         Witu97JkA3BdsLbYFxuUQsVJd2oWb5+5KyqWDNdUR+JhHY0mlZG2ZJEQXra3YJHZLyO+
         ZrCvpkq/5WCp+wY5qlqDI6MXzOCxE8OTzIGKxHVZCVxRmK5MfG4+v9+Ev8sH4eV5irtW
         q7JA==
X-Gm-Message-State: AJIora9GE5xhGDWCulrDOrnyyB46pcHD7zjUrDGKji5NITpYjz70Eh3f
	3SOCGUNKISi+IZEA5sT81HMjve6XAq0=
X-Google-Smtp-Source: AGRyM1vQiNm/I64hNbcGE8zd0cyKohjH6SoOVBwY9xjYiLG+BQDcBgSyuS01ppH+w9E1NDbqP8uyng==
X-Received: by 2002:a17:907:7632:b0:72b:4d5d:ecce with SMTP id jy18-20020a170907763200b0072b4d5deccemr9841203ejc.11.1657813572648;
        Thu, 14 Jul 2022 08:46:12 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id ey6-20020a0564022a0600b00431962fe5d4sm1241399edb.77.2022.07.14.08.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 08:46:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: arm@kernel.org, soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, wens@csie.org, samuel@sholland.org, linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner config64 changes for 5.20
Date: Thu, 14 Jul 2022 17:45:59 +0200
Message-ID: <5838152.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <165781258677.3193274.3635616027978236662.b4-ty@arndb.de>
References: <YsheC0hgyJB9kPsS@kista.localdomain> <165781258677.3193274.3635616027978236662.b4-ty@arndb.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 14. julij 2022 ob 17:31:23 CEST je Arnd Bergmann napisal(=
a):
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> On Fri, 8 Jul 2022 18:40:43 +0200, Jernej Skrabec wrote:
> > Please pull following config64 changes for 5.20.
> >=20
> > Best regards,
> > Jernej
> >=20
> > The following changes since commit=20
f2906aa863381afb0015a9eb7fefad885d4e5a56:
> >   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> >=20
> > [...]
>=20
> Merged into arm/defconfig, thanks!
>=20
> merge commit: 2b4b612638b8e87719f82ab7a9cda8925375eef6
>=20
>        Arnd

Thanks! For the future, can I send changes to 32-bit and 64-bit configs in=
=20
single pull request?

Best regards,
Jernej


