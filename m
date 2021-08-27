Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674F3FC6
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Aug 2021 13:16:15 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 17so5946003pgp.4
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Aug 2021 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WterxneLBK/OCP/E7bFO9SR6ncKFFjBVYrR2V8OSQcQ=;
        b=KL2Yo4CySi2AFRj1BLeMGAl0tFgwTSxjFXRH7Td59NAh6eWduJ2gzDzGmzSC7/YJFT
         ONEWd/ZSnddGymiWAg7ih0pfZACWZwNAT7g96GOIEh9uYlhvR/3McsJTrQPv4PWbz7nB
         xeZevyC4r2jmH6bjT8d3u4Gd1kRfA5tioUn4hQgiJ3uvR3X95fgCXV8EEQIvZWJKsHH2
         Mys9zCwZUCJrwOFMScmEjxQh/wJPywDenMOL1/EZCswsgP0cO8ksKN8rnq0DeFFPAKr3
         tA6ZDmQY2nwkhhWPvsNJgtFATHSIDqoejFbp0LtkQQ0JYUUN7TfXIE7jxsXz0UEJnKhK
         WqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WterxneLBK/OCP/E7bFO9SR6ncKFFjBVYrR2V8OSQcQ=;
        b=KhK93430aaeTkNYIL39P6AoScEYQ6yBQ9o3W53IjdChGj0OYyX4QBBckP1yydWG2Hi
         iOLbE6pANXAp4yXf/u6cjozuiYjLopOqdd4v1Gg/E5JFFZvDZzXJ5Ed8QTVwwt11SClh
         cRXBMeNxUnFX3UK20D1GInLzo95j/T+7jHME1apgUZpXAzaYE5LmO7jFq15WgJOnrPbU
         7SpU0yR/Y84qQvPYHrE9oET7kCnkqAcU5imysLI+H4OwU+orFkV4Mm780w+lYL01iawg
         LyoPtXCFm9K1NiUHuwJObtr1BU7ZuQoKonvO/XhhUb5pzO+rL+t2fNQhRLvKnS1JOt9g
         aYjA==
X-Gm-Message-State: AOAM531E3FU6jIR0Asqdtau+rBcl6VDA6dN2xOaFj0VUVwhcA/jnmQL1
	pj6AkZiUdcQDdoe3JtmszCLqpTRyswEf++C5oCY=
X-Google-Smtp-Source: ABdhPJzLYGADqZhxBCkXHH8aaA6+1exmoi7R3gZCpIBguXGiWFPBtn02FaOs3Wbur95Y7N7SNpE08zmbY4+4+FKZrcI=
X-Received: by 2002:a62:e402:0:b0:3f7:656:6ad2 with SMTP id
 r2-20020a62e402000000b003f706566ad2mr301877pfh.4.1630070174842; Fri, 27 Aug
 2021 06:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
In-Reply-To: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 27 Aug 2021 16:16:03 +0300
Message-ID: <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
Subject: Re: DE2.0 YV12 playback issues after ea067aee45a8
To: jernej.skrabec@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+CC: jernej.skrabec@gmail.com

=D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman Strat=
iienko <r.stratiienko@gmail.com>:
>
> Hello Jernej,
>
> During local testing I faced an issue where YV12 buffers are displayed
> all in blue.
>
> Issue can be fixed by reverting:
> ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
>
> Could you have a look please?
>
> Best regards,
> Roman Stratiienko
